require 'nokogiri'
require 'open-uri'
require 'csv'

PAGE_URL = "http://annuaire-des-mairies.com/"

class ScrapperTownhalls
  attr_accessor :departement

  def initialize(departement)
    @dep = "http://annuaire-des-mairies.com/#{departement}.html"
  end

  def get_all_the_urls_townhalls
      page = Nokogiri::HTML(open(@dep))
      @@url = page.xpath('//p/a').map {|link| link["href"]}.map{|content| content = "http://annuaire-des-mairies.com#{content[1..-1]}"}
      @nom = page.xpath('//p/a').map {|link| link.text}
      @departement = page.xpath('//font/b/a').text.split.last
  end

  def get_the_email_of_a_townhal_from_its_webpage
    @array = []
    n = 0
    while n < @nom.length
      page = Nokogiri::HTML(open(@@url[n]))
      @array << {"name" => @nom[n], "email" => page.css('section[2] tr[4] td[2]').text,  "departement" => @departement}
      n+=1
    end
  end
  
  def array_to_csv
    CSV.open("../../db/townhalls.csv", "a+") do |csv|
     # csv << @array.first.keys
      @array.each do |item|
        csv << item.values
        end
      end
  end
end

def perform
  print "Scrapping en cours ..."
  hauts_de_seine = ScrapperTownhalls.new("hauts-de-seine")
  seine_saint_denis = ScrapperTownhalls.new("seine-saint-denis")
  val_de_marne = ScrapperTownhalls.new("val-de-marne")
  val_de_marne.get_all_the_urls_townhalls
  val_de_marne.get_the_email_of_a_townhal_from_its_webpage
  val_de_marne.array_to_csv
  hauts_de_seine.get_all_the_urls_townhalls
  hauts_de_seine.get_the_email_of_a_townhal_from_its_webpage
  hauts_de_seine.array_to_csv
  seine_saint_denis.get_all_the_urls_townhalls
  seine_saint_denis.get_the_email_of_a_townhal_from_its_webpage
  seine_saint_denis.array_to_csv
end
perform
