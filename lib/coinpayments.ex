defmodule Coinpayments do
  require ApiRequest

  @moduledoc """
    This is a wrapper for the Coinpayments API.
    The function names and parameters are the same as the API calls.
    See [Coinpayments API Documentation](https://www.coinpayments.net/apidoc-intro) for details.

  """

  @doc """
    Get basic account info.
  """
  def get_basic_info, do: ApiRequest.submit("get_basic_info")


  @doc """
    Get nonzero balances
  """
  def balances, do: ApiRequest.submit("balances")

  @doc """
  Get all balances (including nonzero) --
  **`Coinpayments.balances(:all)`**
  """
  def balances(:all), do: ApiRequest.submit("balances", %{"all": "1"})

  @doc """
    Get deposit address --
    required params: `%{currency: "XXX"}`
  """
  def get_deposit_address(%{currency: currency}) do
    ApiRequest.submit("get_deposit_address", %{currency: currency})
  end

  @doc """
    Create a transaction --
    required params: `%{amount: "NN.NN", currency1: "XXX, currency2: "YYY" }`
  """
  def create_transaction(%{ amount: _, currency1: _, currency2: _ } = params) do
    ApiRequest.submit("create_transaction", params)
  end

  def create_transaction(_), do: raise "amount, currency1, currency2 are required."


  @doc """
    Get a callback address --
    required params: `%{currency: "XXX"}`
  """
  def get_callback_address(%{currency: _} = params) do
    ApiRequest.submit("get_callback_address", params)
  end

  def get_callback_address(_), do: raise "currency is required."
  def get_callback_address, do: raise "currency is required."


  @doc """
    Get multiple transactions information - Lets you query up to 25 transaction IDs. --
    required params: `%{txid: "aaaaaa"}`
  """
  def get_tx_info_multi(%{txid: _} = params) do
    ApiRequest.submit("get_tx_info_multi", params)
  end

  def get_tx_info_multi(_), do: raise "txid is required."

  @doc """
    Get Transaction Information --
    required params: `%{txid: "aaaaaa"}`
  """
  def get_tx_info(%{txid: _} = params), do: ApiRequest.submit("get_tx_info", params)

  def get_tx_info(_), do: raise "txid is required."


  @doc """
    Create transfer (with a PayByName tag) --
    required params: `%{amount: "NN.NN", currency: "XXX, pbntag: "$PbName" }`
  """
  def create_transfer(%{amount: _, currency: _, pbntag: _} = params) do
    ApiRequest.submit("create_transfer", params)
  end


  @doc """
    Create transfer (with a Merchant name) --
    required params: `%{amount: "NN.NN", currency: "XXX, merchant: "Merchant" }`
  """
  def create_transfer(%{amount: _, currency: _, merchant: _} = params) do
    ApiRequest.submit("create_transfer", params)
  end

  def create_transfer(_), do: raise "Either pbntag (Pay by name tag) or merchant (merchant ID) is required."


  @doc """
    Create withdrawal --
    required params: `%{amount: "NN.NN", currency: "XXX" }`
  """
  def create_withdrawal(%{amount: _, currency: _} = params) do
    ApiRequest.submit("create_withdrawal", params)
  end

  def create_withdrawal(_), do: raise "amount, currency, are required."


  @doc """
    Create mass withdrawal --
    required params: `%{wd: "[[]]" }` -- this is an associative array. Please
    see [Coinpayments.com API documentation](https://www.coinpayments.net/apidoc-create-withdrawal) for details.
  """
  def create_mass_withdrawal(%{wd: _} = params) do
    ApiRequest.submit("create_mass_withdrawal", params)
  end

  def create_mass_withdrawal(_), do: raise "wd is required."


  @doc """
    Convert coins --
    required params: `%{amount: "NN.NN", from: "XXX", to: "YYY" }`
  """
  def convert(%{amount: _, from: _, to: _} = params), do: ApiRequest.submit("convert", params)

  def convert(_), do: raise "amount, from, and to parameters are required."

  @doc """
    Get withdrawal history
  """
  def get_withdrawal_history, do: ApiRequest.submit("get_withdrawal_history")


  @doc """
    Get withdrawal history --
    optional params: `limit, start, newer`
  """
  def get_withdrawal_history(params), do: ApiRequest.submit("get_withdrawal_history", params)


  @doc """
    Get withdrawal information --
    required params: `%{id: "withdrawal_id"}`
  """
  def get_withdrawal_info(%{id: _} = params), do: ApiRequest.submit("get_withdrawal_info", params)

  def get_withdrawal_info(_), do: raise "id (withdrawal id) is required."


  @doc """
    Get conversion information --
    required params: `%{id: "conversion_id"}`
  """
  def get_conversion_info(%{id: _} = params) do
    ApiRequest.submit("get_conversion_info", params)
  end

  def get_conversion_info(_), do: raise "id (conversion id) is required."

  @doc """
    Get $PayByName tag list
  """
  def get_pbn_list, do: ApiRequest.submit("get_pbn_list")

  @doc """
    Get $PayByName Profile Information --

    required params: `%{pbntag: "$PbnName"}`
  """
  def get_pbn_info(%{pbntag: _} = params) do
    ApiRequest.submit("get_pbn_info",params)
  end

  @doc """
    Update $PayByName Profile --
    required params: `%{tag_id: "tagid"}`
  """
  def update_pbn_tag(%{tagid: _} = params), do: ApiRequest.submit("update_pbn_tag", params)

  def update_pbn_tag(_), do: raise "tagid (tag's unique ID (obtained from 'get_pbn_list) is required."

  @doc """
    Claim $PayByName Tag --
    required params: `%{tag_id: "unused_tagid", name: "newname"}`
  """
  def claim_pbn_tag(%{tagid: _, name: _} = params), do: ApiRequest.submit("claim_pbn_tag", params)

  def claim_pbn_tag(_) do
    raise "name (for the tag) and tagid (tag's unique ID (obtained from 'get_pbn_list) are required."
  end

  @doc """
    Get exchange rates / supported coins
  """
  def rates, do: ApiRequest.submit("rates")

  @doc """
    Get exchange rates / supported coins --
    optional params: `short, accepted`
  """
  def rates(params), do: ApiRequest.submit("rates", params)

end
