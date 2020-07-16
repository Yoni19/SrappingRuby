require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))



def get_currency(row)
  row.css('td')[5].text.split(" ")[1]
end

def get_price(row)
  row.css('td')[3].text[1..-1].tr(',','').to_f
end

def cmc_scrapper()
  current_page = 1
  result = {}
  puts "C'est parti ! Scrappons tout ça ! Analyse en cours : "
  while current_page < 29 do 
    puts "Scraping de la page #{current_page}"
    page = Nokogiri::HTML(open("https://coinmarketcap.com/#{current_page}"))
    rows = page.xpath('//tr[@class="cmc-table-row"]')

    rows.each do |row|
      currency = get_currency(row)
      result[currency] = get_price(row)
    end 
    current_page = current_page + 1 
  end
  return result
end

result = cmc_scrapper
puts result

#result = cmc_scrapper
#puts result