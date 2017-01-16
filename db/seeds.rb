require_relative '../lib/services/wikipedia_scraper_service'

def create_episode(day_month, episode, episode_type)
  Episode.create(
    day_month_id: day_month.id,
    year: episode['year'].gsub('BC', '').strip.to_i,
    bce: episode['year'].include?('BC'),
    episode_type: episode_type,
    text: episode['data']
  )
end

unless File.exist?('./db/episodes.json')
  puts 'episodes.json not found. Beginning to generate it...'
  scrap
end

file = File.read('./db/episodes.json')
data_hash = JSON.parse(file)

data_hash.each do |key, value|
  begin
    puts "Adding data recorded for #{key.tr('-', ' ')}..."
    date = Date.strptime(key, '%B-%d')

    day_month = DayMonth.create!(day: date.day,
                                 month: date.month,
                                 description: value['description'])

    value['events'].each { |event| create_episode(day_month, event, 'event') }
    value['births'].each { |birth| create_episode(day_month, birth, 'birth') }
    value['deaths'].each { |death| create_episode(day_month, death, 'death') }
  rescue ArgumentError
    puts 'It seems this date does not exist.'
    next
  end
end
