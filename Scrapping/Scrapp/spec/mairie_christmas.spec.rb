require_relative '../lib/mairie_christmas'
require 'rspec/autorun'


describe "mairie_christmas" do
  it "find mail" do
    expect(main_function().select{|x| x.keys == ["VILLIERS LE BEL"]}[0]["VILLIERS LE BEL"]).to eq("secretariatgeneral@ville-villiers-le-bel.fr")
  end

  it "find mail" do
    expect(main_function().select{|x| x.keys == ["MONTMORENCY"]}[0]["MONTMORENCY"]).to eq("directiongenerale@ville-montmorency.fr")
  end

end