defmodule CoinpaymentsTest do
  use ExUnit.Case, async: false
  import Mock

  doctest Coinpayments

  describe "get_basic_info/0" do
    test "get_basic_info" do
      with_mock ApiRequest, [submit: fn(_cmd) -> "something" end] do
        result = Coinpayments.get_basic_info()
        assert result == "something"
        assert called(ApiRequest.submit("get_basic_info"))
      end
    end
  end

  describe "balances" do

    test "balances/0" do
      with_mock ApiRequest, [submit: fn(_cmd) -> "something" end] do
        Coinpayments.balances()
        assert called(ApiRequest.submit("balances"))
      end
    end

    test "balances(:all)/1" do
      with_mock ApiRequest, [submit: fn(_cmd, _opts) -> "something" end] do
        Coinpayments.balances(:all)
        assert called(ApiRequest.submit("balances", %{"all": "1"}))
      end
    end
  end

  describe "get_deposit_address/1" do
    test "get_deposit_address" do
      opts = %{currency: "BTC"}
      with_mock ApiRequest, [submit: fn(_cmd, _opts) -> "something" end] do
        Coinpayments.get_deposit_address(%{currency: "BTC"})
        assert called(ApiRequest.submit("get_deposit_address", %{currency: "BTC"}))
      end
    end

    test "get_deposit_address when currency is missing" do
      with_mock ApiRequest, [submit: fn(_cmd) -> "something" end] do
        catch_error Coinpayments.get_deposit_address
        refute called(ApiRequest.submit("get_deposit_address"))
      end
    end
  end

  describe "create_transaction/1" do

    test "create_transaction when all required options are provided" do
      opts = %{:amount => "12.00", :currency1 => "BTC", :currency2 => "USD"}
      with_mock ApiRequest, [submit: fn(_cmd,_opts) -> "something" end] do
        Coinpayments.create_transaction(opts)
        assert called(ApiRequest.submit("create_transaction", opts))
      end
    end

    test "create_transaction when a required option is missing" do
      opts = %{:amount => "12.00", :currency1 => "BTC"}
      with_mock ApiRequest, [submit: fn(_cmd,_opts) -> "something" end] do
        catch_error Coinpayments.create_transaction(opts)
        refute called(ApiRequest.submit("create_transaction", opts))
      end
    end
  end

  describe "get_callback_address/1" do

    test "get_callback_address when all required options are provided" do
      opts = %{:currency => "BTC"}
      with_mock ApiRequest, [submit: fn(_cmd,_opts) -> "something" end] do
        Coinpayments.get_callback_address(opts)
        assert called(ApiRequest.submit("get_callback_address", opts))
      end
    end

    test "get_callback_address when a required option is missing" do
      opts = %{foo: "bar"}
      with_mock ApiRequest, [submit: fn(_cmd,_opts) -> "something" end] do
        catch_error Coinpayments.get_callback_address(opts)
        refute called(ApiRequest.submit("get_callback_address", opts))
      end
    end

  end
end
