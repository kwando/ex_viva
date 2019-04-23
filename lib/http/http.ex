defmodule HTTP do
  def request(request, opts \\ []) do
    request = preprocess_request(request, opts)

    {:ok, status, headers, client} = :hackney.request(request.method, request.url, request.headers, request.body, request.options)
    {:ok, body} = :hackney.body(client)

    {:ok, {status, headers, body} |> apply_transforms(request.response_handlers) }
  end

  defp apply_transforms(response, []), do: response
  defp apply_transforms(response, [ transform | transforms ]) do
    response
    |> apply_transforms(transforms)
    |> apply_transform(transform)
  end

  defp apply_transform({status, headers, body}, :normalize_headers) do
    {status, normalize_headers(headers), body}
  end

  defp apply_transform({status, headers, body}, :decode_json) do
    {:ok, json} = Jason.decode(body)
    {status, headers, json}
  end

  defp apply_transform({status, headers, body}, module) when is_atom(module) do
    module.handle_response({status, headers, body}, [])
  end

  defp normalize_headers(headers) do
    for {header, value} <- headers do
      {String.downcase(header), value}
    end
  end

  defp preprocess_request(request, opts) do
    %{ request |
      url: process_url(request.url, Keyword.get(opts, :base_url))
    }
    |> process_body()
  end

  defp process_body(%{body: {:json, data}} = request) do
    request
    |> HTTP.Request.put_header("Content-Type", "application/json")
    |> Map.put(:body, Jason.encode!(data))
  end

  defp process_body(%{body: ""} = request) do
    request
  end

  defp process_url("/" <> _, nil) do
    raise ArgumentError, "relative urls is not supported"
  end

  defp process_url("/" <> path, base_url) do
    "#{base_url}/#{path}"
  end

  defp process_url(url, _) do
    url
  end

end
