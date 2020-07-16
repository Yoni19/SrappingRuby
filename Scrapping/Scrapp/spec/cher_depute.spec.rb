require_relative '../lib/cher_depute'
require 'rspec/autorun'


describe "cher_depute" do
  it "find mail" do
    expect(main_function().select{|x| (x["nom"] == "Woerth") && (x["prenom"] == "Éric")}[0]["email"]).to eq("eric.woerth@assemblee-nationale.fr")
  end
end
