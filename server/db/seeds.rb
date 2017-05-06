require 'on_this_day_scraper'

JSON_DIR = './db/episodes.json'.freeze

def create_episode(day_month, episode, episode_type)
  ar_episode = Episode.create!(
    day_month_id: day_month.id,
    year: episode['year'].gsub('BC', '').strip.to_i,
    bce: episode['year'].include?('BC'),
    episode_type: episode_type,
    text: episode['data']
  )

  episode['kw'].each do |kw|
    ar_episode.keywords << Keyword.create!(title: kw['title'], href: kw['href'])
  end
end

unless File.exist?(JSON_DIR)
  puts 'episodes.json not found. Beginning to generate it...'
  scrap_year(JSON_DIR)
end

file = File.read(JSON_DIR)
data_hash = JSON.parse(file)

data_hash.each do |key, value|
  begin
    puts "Adding data recorded for #{key.tr('-', ' ')}..."
    date = Date.strptime("2016-#{key}", '%Y-%B-%d')

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
