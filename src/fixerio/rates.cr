module Fixerio
  class Rates
    JSON.mapping({
      base:       String,
      date:       String,
      currencies: {type: Currencies, key: "rates"}
    })
  end

  class Currencies
    JSON.mapping({
      aud:  {type: Float64, key: "AUD", default: 0.0},
      bgn:  {type: Float64, key: "BGN", default: 0.0},
      brl:  {type: Float64, key: "BRL", default: 0.0},
      cad:  {type: Float64, key: "CAD", default: 0.0},
      chf:  {type: Float64, key: "CHF", default: 0.0},
      cny:  {type: Float64, key: "CNY", default: 0.0},
      czk:  {type: Float64, key: "CZK", default: 0.0},
      dkk:  {type: Float64, key: "DKK", default: 0.0},
      eur:  {type: Float64, key: "EUR", default: 0.0},
      gbp:  {type: Float64, key: "GBP", default: 0.0},
      hkd:  {type: Float64, key: "HKD", default: 0.0},
      hrk:  {type: Float64, key: "HRK", default: 0.0},
      huf:  {type: Float64, key: "HUF", default: 0.0},
      idr:  {type: Float64, key: "IDR", default: 0.0},
      ils:  {type: Float64, key: "ILS", default: 0.0},
      inr:  {type: Float64, key: "INR", default: 0.0},
      jpy:  {type: Float64, key: "JPY", default: 0.0},
      krw:  {type: Float64, key: "KRW", default: 0.0},
      mxn:  {type: Float64, key: "MXN", default: 0.0},
      myr:  {type: Float64, key: "MYR", default: 0.0},
      nok:  {type: Float64, key: "NOK", default: 0.0},
      nzd:  {type: Float64, key: "NZD", default: 0.0},
      php:  {type: Float64, key: "PHP", default: 0.0},
      pln:  {type: Float64, key: "PLN", default: 0.0},
      ron:  {type: Float64, key: "RON", default: 0.0},
      rub:  {type: Float64, key: "RUB", default: 0.0},
      sek:  {type: Float64, key: "SGD", default: 0.0},
      thb:  {type: Float64, key: "THB", default: 0.0},
      try:  {type: Float64, key: "TRY", default: 0.0},
      usd:  {type: Float64, key: "USD", default: 0.0},
      zar:  {type: Float64, key: "ZAR", default: 0.0}
    })
  end
end