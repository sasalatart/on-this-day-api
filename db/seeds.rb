require_relative '../lib/services/wikipedia_scraper_service'

def create_episode(episode, episode_type, day, month)
  Episode.create(
    day: day,
    month: month,
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
    puts "Creating episodes that occurred on #{key.tr('-', ' ')}..."
    date = Date.strptime(key, '%B-%d')

    # value[:description]

    value['events'].each { |event| create_episode(event, 'event', date.day, date.month) }
    value['births'].each { |birth| create_episode(birth, 'birth', date.day, date.month) }
    value['deaths'].each { |death| create_episode(death, 'death', date.day, date.month) }
  rescue ArgumentError
    puts 'It seems this date does not exist.'
    next
  end
end
