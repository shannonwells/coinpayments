defmodule Coinpayments do
  require ApiRequest

  @moduledoc """
    Coinpayments:
    functions mirror the API commands.
    See https://www.coinpayments.net/apidoc-intro for details.
  """

  @doc """
    __get_basic_info/0__
  """
  def get_basic_info, do: ApiRequest.submit("get_basic_info")


  @doc """
    __balances/0__ : gets nonzero balances
    __balances/1__ : only allowed param is `:all`
  """
  def balances, do: ApiRequest.submit("balances")
  def balances(:all), do: ApiRequest.submit("balances", %{"all": "1"})

  @doc """
    __get_deposit_address/1__
    required params: `%{currency: "XXX"}`
  """
  def get_deposit_address(%{currency: currency}) do
    ApiRequest.submit("get_deposit_address", %{currency: currency})
  end

  @doc """
    __create_transaction/1__
    required params: `%{amount: "NN.NN", currency1: "XXX, currency2: "YYY" }`
  """
  def create_transaction(%{ amount: _, currency1: _, currency2: _ } = params) do
    ApiRequest.submit("create_transaction", params)
  end

  def create_transaction(_), do: raise "amount, currency1, currency2 are required."


  @doc """
    get_callback_address/1__
    required params: `%{currency: "XXX"}`
  """
  def get_callback_address(%{currency: _} = params) do
    ApiRequest.submit("get_callback_address", params)
  end

  def get_callback_address(_), do: raise "currency is required."
  def get_callback_address, do: raise "currency is required."


  @doc """
    get_tx_info_multi/1__
    required params: `%{txid: "aaaaaa"}`
  """
  def get_tx_info_multi(%{txid: _} = params) do
    ApiRequest.submit("get_tx_info_multi", params)
  end

  def get_tx_info_multi(_), do: raise "txid is required."

  @doc """
    get_tx_info/1__
    required params: `%{txid: "aaaaaa"}`
  """
  def get_tx_info(%{txid: _} = params), do: ApiRequest.submit("get_tx_info", params)

  def get_tx_info(_), do: raise "txid is required."


  @doc """
    __create_transfer/1__
    required params: `%{amount: "NN.NN", currency: "XXX, pbntag: "$PbName" }`
    OR
    required params: `%{amount: "NN.NN", currency: "XXX, merchant: "Merchant" }`
  """
  def create_transfer(%{amount: _, currency: _, pbntag: _} = params) do
    ApiRequest.submit("create_transfer", params)
  end

  def create_transfer(%{amount: _, currency: _, merchant: _} = params) do
    ApiRequest.submit("create_transfer", params)
  end

  def create_transfer(_), do: raise "Either pbntag (Pay by name tag) or merchant (merchant ID) is required."


  @doc """
    __create_withdrawal/1__
    required params: `%{amount: "NN.NN", currency: "XXX" }`
  """
  def create_withdrawal(%{amount: _, currency: _} = params) do
    ApiRequest.submit("create_withdrawal", params)
  end

  def create_withdrawal(_), do: raise "amount, currency, are required."


  @doc """
    __create_mass_withdrawal/1__
    required params: `%{wd: "[[]]" }` -- this is an associative array. Please
    see Coinpayments.com API documentation for details.
  """
  def create_mass_withdrawal(%{wd: _} = params) do
    ApiRequest.submit("create_mass_withdrawal", params)
  end

  def create_mass_withdrawal(_), do: raise "wd is required."


  @doc """
    __convert/1__
    required params: `%{amount: "NN.NN", from: "XXX", to: "YYY" }`
  """
  def convert(%{amount: _, from: _, to: _} = params), do: ApiRequest.submit("convert", params)

  def convert(_), do: raise "amount, from, and to parameters are required."

  @doc """
    __get_withdrawal_history/0__
  """
  def get_withdrawal_history, do: ApiRequest.submit("get_withdrawal_history")


  @doc """
    __get_withdrawal_history/1__
    optional params: `limit, start, newer`
  """
  def get_withdrawal_history(params), do: ApiRequest.submit("get_withdrawal_history", params)


  @doc """
  __get_withdrawal_info/0__
  """
  def get_withdrawal_info(_), do: raise "id (withdrawal id) is required."


  @doc """
  __get_conversion_info/1__
  required params: `%{id: "conversionid"}`
  """
  def get_conversion_info(%{id: _} = params) do
    ApiRequest.submit("get_conversion_info", params)
  end

  def get_conversion_info(_), do: raise "id (conversion id) is required."

  @doc """
    __get_pbn_list/0__
  """
  def get_pbn_list, do: ApiRequest.submit("get_pbn_list")

  @doc """
    __get_pbn_info/1__
    required params: `%{pbntag: "$PbnName"}`
  """
  def get_pbn_info(%{pbntag: _} = params) do
    ApiRequest.submit("get_pbn_info",params)
  end

  @doc """
    __update_pbn_tag/1__
    required params: `%{tag_id: "tagid"}`
  """
  def update_pbn_tag(%{tagid: _} = params), do: ApiRequest.submit("update_pbn_tag", params)

  def update_pbn_tag(_), do: raise "tagid (tag's unique ID (obtained from 'get_pbn_list) is required."

  @doc """
    __claim_pbn_tag/1__
    required params: `%{tag_id: "tagid", name: "name"}`
  """
  def claim_pbn_tag(%{tagid: _, name: _} = params), do: ApiRequest.submit("claim_pbn_tag", params)

  def claim_pbn_tag(_) do
    raise "name (for the tag) and tagid (tag's unique ID (obtained from 'get_pbn_list) are required."
  end

  @doc """
    __rates/0__
  """
  def rates, do: ApiRequest.submit("rates")

  @doc """
    __rates/0__
    optional params: `short, accepted`
  """
  def rates(params), do: ApiRequest.submit("rates", params)

end
