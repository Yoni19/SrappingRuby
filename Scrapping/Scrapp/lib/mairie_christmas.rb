
require 'nokogiri'
require 'open-uri'

def get_townhall_urls() 
  page_95 = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  puts 'Selectionner des liens vers les mairies'
  mairies_links = page_95.xpath('//a[@class="lientxt"]')
  return mairies_links
end

def get_townhall_email(townhall_url)
  page_mairie = Nokogiri::HTML(open(townhall_url))
  lines = page_mairie.css('table')[0].css('tr')
  email = lines[4].css('td')[1].text
  return email
end

def main_function()
  result = []
  links = get_townhall_urls()
  links.each do |link|
    puts "Analyse en cours : #{link.text}"
    mairie_infos = {}
    email = get_townhall_email('http://annuaire-des-mairies.com/' + link['href'])
    mairie_infos[link.text] = email
    result << mairie_infos
  end
  return result
end

result = main_function()
