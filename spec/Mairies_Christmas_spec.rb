require_relative '../lib/Mairies_Christmas.rb'

describe get_townhall_email do
    it "should " do
      expect(get_townhall_email("http://annuaire-des-mairies.com/95/ableiges.html")).to eq({"ABLEIGES"=>"mairie.ableiges95@wanadoo.fr"})
    end
end
