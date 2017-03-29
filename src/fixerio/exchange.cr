require "./rates"

module Fixerio
  module Exchange
    private BASE_URL = "https://api.fixer.io"

    def latest(base : Currency, symbols = [] of Currency)
      url = get_url "latest", base, symbols

      Rates.from_json execute_request url
    end

    def historical(date : Time, base : Currency, symbols = [] of Currency)
      url = get_url date.to_s("%Y-%m-%d"), base, symbols

      Rates.from_json execute_request url
    end

    private def get_url(action, base, symbols)
      params = HTTP::Params.build do |p|
        p.add "base", base.to_s
        p.add "symbols", symbols.join(",") if symbols.size > 0
      end

      "#{BASE_URL}/#{action}?#{params}"
    end

    private def execute_request(url)
      response = HTTP::Client.get("#{url}")

      raise Exception.new("Received #{response.status_code} status.") if response.status_code != 200
      
      response.body
    end
  end
end