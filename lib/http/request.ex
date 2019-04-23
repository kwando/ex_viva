defmodule HTTP.Request do
  defstruct [
    method: :get,
    url: nil,
    headers: [],
    body: "",
    options: [],
    response_handlers: []
  ]

  def get(url) do
    %__MODULE__{url: url, method: :get}
  end

  def post(url, body \\ "") do
    %__MODULE__{url: url, method: :post, body: body}
  end

  def put_header(%__MODULE__{headers: headers} = req, header, value) do
    %{ req | headers: [{header, value} | headers] }
  end

  def basic_auth(request, username, password) do
    credentials = Base.encode64("#{username}:#{password}")
    request
    |> put_header("Authorization", "Basic #{credentials}")
  end

  def accept_json(request) do
    request
    |> put_header("Accept", "application/json")
    |> add_response_handler(:decode_json)
  end

  def add_response_handler(%__MODULE__{} = req, handler) do
    %{ req | response_handlers: [ handler | req.response_handlers] }
  end

  def method(%__MODULE__{method: method}) do
    method
  end

  def method(%__MODULE__{} = req, method) do
    %{ req | method: method }
  end
end
