# Coinpayments

A wrapper for the Coinpayments API v1 in Elixir.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `coinpayments` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:coinpayments, "~> 0.5.0"}
  ]
end
```

Then running ` mix deps.get`.

Afterward, set up per-environment config files to set API key and secret.  Please see the `config/dev.secret.exs.example`.

## Usage

* One can verify that it is working by running:
    ```
    iex -S mix
    iex> Coinpayments.get_basic_info
    
    body: "{\"error\":\"ok\",\"result\":{\"uername\":\"MyFancyUser\",\"username\":\"MyFancyUser\",\"merchant_id\":\"somehexcode\",\"email\":\"someuser@example.com\",\"public_name\":\"MyFancyUser\",\"time_joined\":11111111111}}",
     headers: %{"access-control-allow-origin" => "*",
       "cache-control" => "no-store, no-cache, must-revalidate, post-check=0, pre-check=0",
       "connection" => "Keep-Alive",
       "content-disposition" => "attachment; filename=coinpayments_api.json",
       "content-length" => "196", "content-type" => "application/json",
       "date" => "Mon, 19 Mar 2018 23:09:43 GMT",
       "expires" => "Thu, 19 Nov 1981 08:52:00 GMT",
       "keep-alive" => "timeout=5, max=98", "pragma" => "no-cache",
       "server" => "Apache",
       "set-cookie" => "incap_ses_124_992349=QA+iiiiivvvvcccc8888jjjjbbbbZZZZ8pjNkFBtUi+jy81/A==; path=/; Domain=.coinpayments.net",
       "strict-transport-security" => "max-age=31536000", "x-cdn" => "Incapsula",
       "x-frame-options" => "sameorigin",
       "x-iinfo" => "9-87141792-87137184 PNNN RT(1521500982876 171) q(0 0 0 0) r(2 2) U6"},
     method: :post, opts: [], query: [], status: 200,
     url: "https://www.coinpayments.net/api.php"}
    ```

* Functions are the same name as their corresponding API endpoints, and options are passed in a Map:
    ```
    iex> get_withdrawal_history(%{limit: 100,  start: 1234, newer: 1919191})
    
    ```

#### Please see the [Coinpayments API Documentation](https://www.coinpayments.net/apidoc-intro) for more details about the different available commands and options.


## Contributing
Please fork and submit a pull request. Pull requests that fix [current issues](https://github.com/shannonwells/coinpayments_ex/issues) will be prioritized highest.
