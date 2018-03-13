defmodule HttpRequestMocks do
  @moduledoc false

  def mock_coinpayments_ok_result do
    %{
      body: "{\"error\":\"ok\",\"result\":{\"uername\":\"someuser\",\"username\":\"someuser\",\"merchant_id\":\"3c81a4c527574da7311f8154deadbeef\",\"email\":\"yoliswrld@gmail.com\",\"public_name\":\"someuser\",\"time_joined\":1484815111}}",
      headers: %{"content-disposition" => "attachment; filename=coinpayments_api.json",
        "content-type" => "application/json", },
      method: :post,
      status: 200,
      url: "https://www.coinpayments.net/api.php"
    }
  end

end
