
MoneyRails.configure do |config|
    config.default_currency = :mad
    config.register_currency = {
        :id                  => :mad,
        :iso_code            => "MAD",
        :symbol              => "Dhs",
        :subunit             => "Cent",
        :subunit_to_unit     => 100,
        :thousands_separator => ",",
        :decimal_mark        => "."
    }
end
