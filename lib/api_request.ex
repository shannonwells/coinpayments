defmodule ApiRequest do
  @moduledoc false
  @base_url "https://www.coinpayments.net/api.php"


  def submit(command) do
    %{"version": "1",
      "key": Application.get_env(:coinpayments, :api_key),
      "cmd": command }
    |> post
  end

  def submit(command, options) do
    options
    |> Map.merge(%{"version": "1",
                   "key": Application.get_env(:coinpayments, :api_key),
                   "cmd": command })
    |> post
  end

  defp post(post_data) do
    encoded_data = post_data |> URI.encode_query
    Tesla.post(@base_url, encoded_data,
      headers: %{"HMAC" => encoded_data |> hmac512,
                 "Content-Type" => "application/x-www-form-urlencoded"})
  end


  defp hmac512(message) do
    :crypto.hmac(:sha512, Application.get_env(:coinpayments, :api_secret), message)
    |> Base.encode16
  end

end
