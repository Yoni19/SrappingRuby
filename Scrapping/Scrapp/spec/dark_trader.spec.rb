require_relative '../lib/dark_trader'
require 'rspec/autorun'


describe "dark_trader" do
  it "translates one character correctly" do
    expect((cmc_scrapper()["BTC"] / 1000).to_i).to eq(9)
  end
end

