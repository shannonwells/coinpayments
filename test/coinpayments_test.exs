defmodule CoinpaymentsTest do
  use ExUnit.Case
  doctest Coinpayments

  test "" do
    assert Coinpayments.get_info().body == "something"
  end

end
