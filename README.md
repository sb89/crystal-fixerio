# fixerio

fixer.io wrapper in Crystal.

Documentation: http://fixer.io/

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  fixerio:
    github: sb89/crystal-fixerio
```

## Usage

```crystal
require "fixerio"

# Pass in GBP as base currency
rates = Fixerio.latest(Fixerio::Currency::GBP)

p "1 GBP : #{rates.currencies.usd} USD"
p "1 GBP : #{rates.currencies.aud} AUD"
```

You can also get the rates for a previous date:
```crystal
require "fixerio"

rates = Fixerio.historical(Time.new(2016, 2, 15), Fixerio::Currency::GBP)

p "The exchange rates on the 15th of Feb 2016 were: "
p "1 GBP : #{rates.currencies.usd} USD"
p "1 GBP : #{rates.currencies.aud} AUD"
```

If you wish, you can retrieve only specified currencies (the rest will be 0.0) by passing an array:

```crystal
require "fixerio"

rates = Fixerio.latest(Fixerio::Currency::GBP, [Fixerio::Currency::AUD, Fixerio::Currency::USD])

p rates.currencies.aud
p rates.currencies.usd

# The following will return 0.0
p rates.currencies.cad
p rates.currencies.bgn
p rates.currencies.brl
```

## Contributing

1. Fork it ( https://github.com/[your-github-name]/fixerio/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- sb89 (https://github.com/sb89) Steven Blake - creator, maintainer
