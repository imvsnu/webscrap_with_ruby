  require 'nokogiri'
  require 'httparty'

  class Scrap
    attr_accessor :parse_page

    def initialize  
      doc = HTTParty.get('http://www.ekantipur.com/')
      @parse_page = Nokogiri::HTML(doc)
    end
    
    def get_titles
      parse_page.css(".display-news-title").css("h1").css("a").children.map { |name| name.text }.compact
    end

  end

  s = Scrap.new
  titles = s.get_titles

  (0..titles.size).each do |index|
    puts "#{index+1}) #{titles[index]} \n"
  end