defmodule Coinpayments do
  @moduledoc """
    Coinpayments:
    functions mirror the API commands.
  """


  def get_info do
    cmd = "get_basic_info"
    post_data = ["version": "1",
      "cmd": cmd,
      "key": System.get_env("CPBK")]
  end

  def get_coin_balances do
    cmd = "balances"
    post_data = ["version": "1",
      "cmd": cmd, "all": "1",
      "key": System.get_env("CPBK")]
  end


  def hmac512(message) do
    privkey = System.get_env("CPPK")
    :crypto.hmac(:sha512, privkey, message)
    |> Base.encode16
  end
end
