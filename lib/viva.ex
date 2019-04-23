defmodule Viva do
  @base_request %HTTP.Request{response_handlers: [:normalize_headers, :decode_json]}

  def insert(collection, event) do
    database = "viva"
    HTTP.Request.post("/_db/#{database}/_api/document/#{collection}", {:json, event})
    |> HTTP.Request.basic_auth("viva", "qwe123")
    |> HTTP.Request.accept_json()
    |> HTTP.Request.add_response_handler(:decode_json)
    |> HTTP.Request.add_response_handler(:normalize_headers)
    |> IO.inspect(label: "request")
    |> HTTP.request(base_url: "http://127.0.0.1:8529")
  end

  def get_stations() do
    HTTP.Request.get("https://services.viva.sjofartsverket.se:8080/output/vivaoutputservice.svc/vivastation")
    |> HTTP.Request.accept_json()
    |> HTTP.Request.put_header("Host", "services.viva.sjofartsverket.se:8080")
    |> HTTP.request()
  end
end
