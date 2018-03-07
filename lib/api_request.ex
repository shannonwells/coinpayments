defmodule ApiRequest do
  @moduledoc """
  Abstracts away the API request
"""
  @base_url "https://www.coinpayments.net/api.php"

  def post(command, options) do
    post_data = options
      |> Map.merge(%{"version": "1", key: "System.get_env("CPBK")})



    hmac = post_data
      |> URI.encode_query
      |> hmac512

    resp = Tesla.post(@base_url, post_data,
      headers: %{"HMAC" => hmac, "Content-Type" => "application/x-www-form-urlencoded"})
    resp

  end

end
