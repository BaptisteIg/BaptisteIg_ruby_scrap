require_relative '../lib/Dark_Trader.rb'

describe super_hash do
    it "should do an array of 200" do
      expect(super_hash.size).to eq(200)
    end
    it "should be an array" do
      expect(super_hash).to be_an_instant_of(Array)
    end
    it "should be a Hash in an array" do
      expect(super_hash[0]).to be_an_ub=nstant_of(Hash)
    end
end

super_hash ("https://coinmarketcap.com/all/views/all/")
