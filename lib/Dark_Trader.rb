require 'rubygems'
require 'nokogiri'
require 'open-uri'

def super_hash (url)
    page = Nokogiri::HTML(open(url))

    currencies_names = []
    page.xpath("//tr/td[3]/div").each do |name|
        currencies_names << name.text
    end


    currencies_values = []
    page.xpath("//tr/td[5]/a").each do |value|
        currencies_values << value.text.delete("$,").to_f
    end

    hash_new = Hash.new
    hash_new = currencies_names.zip(currencies_values)
   

    final_tab = []
    hash_new.each do |result|
        hash_result = Hash.new
        hash_result[result[0]]=result[1]
        final_tab << hash_result
    end
    return final_tab.to_s
end 

super_hash ("https://coinmarketcap.com/all/views/all/")

