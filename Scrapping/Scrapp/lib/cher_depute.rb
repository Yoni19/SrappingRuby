require 'nokogiri'
require 'open-uri'

result = 1

def get_deputes_url()
  page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
  return page.xpath('//a[contains(@href, "/deputes/fiche")]').map{|x| [x.text, 'http://www2.assemblee-nationale.fr' + x['href']]}.to_h
end

def get_email(page)
  return page.xpath("//a[contains(@href, 'mailto')]")[0]['href'][7..-1]
end

def main_function()
  deputes_url = get_deputes_url()
  total = deputes_url.length
  result = []
  current = 1
  deputes_url.each do |name, url|  
  puts "#{current}/#{total} Scrapping en cours : #{name}"
  page = Nokogiri::HTML(open(url))
  begin
    email = get_email(page)
  rescue
    email = ""
    puts "An error has occurred with #{url}"
  end
  nom = name.split(" ")[2]
  prenom = name.split(" ")[1]
  dep = {}
  dep["#"] = current
  dep["nom"] = nom
  dep["prenom"] = prenom
  dep["email"] = email
  dep["fiche"] = url
  result << dep
  current = current + 1
  end
  return result
end

#result = main_function()
