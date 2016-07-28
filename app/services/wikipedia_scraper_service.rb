require 'open-uri'
require 'nokogiri'
require 'date'

class WikipediaScraperService
  def self.parse_ul(ul)
    ul.css('li').map do |li|
      data_array = li.text.split(' – ')
      { year: data_array[0], data: data_array[1] }
    end
  end

  def self.scrap(day, month)
    date = Date._strptime("#{day}/#{month}", '%d/%m')

    day = date[:mday]
    month = Date::MONTHNAMES[date[:mon]]
    url = "https://en.wikipedia.org/wiki/#{month}_#{day}"

    html = Nokogiri::HTML(open(url))

    puts "Scraping #{day}/#{month}"

    begin
      events_ul = html.css('#Events')[0].parent.next_element
      births_ul = html.css('#Births')[0].parent.next_element
      deaths_ul = html.css('#Deaths')[0].parent.next_element

      { events: parse_ul(events_ul), births: parse_ul(births_ul), deaths: parse_ul(deaths_ul) }
    rescue NoMethodError
      puts 'It seems this month does not have any episodes.'
      false
    end
  end
end
