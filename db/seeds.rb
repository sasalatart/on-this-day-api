require_relative '../lib/services/wikipedia_scraper_service'

def create_episode(episode, episode_type, day, month)
  bce = episode[:year].include?('BC')
  year = episode[:year].gsub('BC', '').strip.to_i

  Episode.create(day: day, month: month, year: year, bce: bce,
                 episode_type: episode_type, text: episode[:data])
end

(1..12).each do |month|
  (1..31).each do |day|
    json = WikipediaScraperService.scrap(day, month)

    next unless json

    events = json[:events]
    births = json[:births]
    deaths = json[:deaths]

    events.each { |event| create_episode(event, 'event', day, month) }
    births.each { |birth| create_episode(birth, 'birth', day, month) }
    deaths.each { |death| create_episode(death, 'death', day, month) }
  end
end
