require 'rubygems'
require 'nokogiri'
require 'open-uri'


def get_townhall_email(townhall_url)
    page = Nokogiri::HTML(open(townhall_url))
    mairies_emails = Hash.new
    mairies_emails [page.xpath("/html/body/div[1]/main/section[1]/div/div/div/p[1]/strong[1]/a").text] = page.xpath("/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]").text
    mairies_emails
end


#puts get_townhall_email("http://annuaire-des-mairies.com/95/avernes.html").to_s


def get_townhall_urls
    urls = []
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    page.xpath("//tr/td/p/a/@href").each do |ville|
    urls << "http://annuaire-des-mairies.com" + ville.text.delete_prefix(".")
    end
    urls
end

def perform
    result =[]
    get_townhall_urls.each do |url|
        result << get_townhall_email(url)
    end
    result
end

puts perform.to_s