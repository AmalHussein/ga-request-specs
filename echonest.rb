require 'echowrap'

Echowrap.configure do |config|
  config.api_key = 
    config.consumer_key = 
    config.shared_secret = 
end

# Echowrap.artist_top_hottt(:genre => 'hip hop').each do |artist|
#   puts "Artist: #{artist.name}"
# end


# Echowrap.artist_top_terms(:results => 10).each do |term|
#   puts "Term: #{term.name}"
#   #   Echowrap.artist_top_hottt(:genre => term.name).each do |artist|
#   #      puts "Artist: #{artist.name}"
#   #    end
# end

num_of_retries = 0
sleep_time = 10
begin

  %w{ rock pop house jazz country soul}.each do |genre|

    puts "Genre: #{genre}"

    Echowrap.artist_top_hottt(:genre => genre).each do |artist|
      #    puts "Artist: #{artist.inspect}"
      puts "Artist: #{artist.name}"

      # Other genres for this artist
      Echowrap.artist_terms(:id => artist.id).each do |genre|
        puts "artist #{artist.name} genre is #{genre.name}"
      end

      # artist biographies
      bio = Echowrap.artist_biographies(id: artist.id, results: 1).first
      puts "bio text: #{bio.text}"
      puts "bio url: #{bio.url}"

      Echowrap.artist_songs(id: artist.id, results: 10).each do |song|
        puts "song: #{song.title}"
      end
    end
  end

rescue Echowrap::Error::TooManyRequests
  puts "Retry: #{num_of_retries}"
  num_of_retries = num_of_retries - 1
  if num_of_retries >= 0
    puts "Sleeping for #{sleep_time} seconds before trying again"
    sleep(sleep_time)
    retry
  end
end
exit

# Echowrap.artist_top_terms(:results => 10).each do |term|
#   puts "Term: #{term.inspect}"

# end
exit 
# Echowrap.artist_search(:name => 'Jethro Tull', :results => 20).each do |artist|
#   puts "Artist is #{artist.inspect}"
# end
Echowrap.artist_similar(:name => 'Radiohead', :results => 10).each do |artist|
  puts "Artist is #{artist.name}"

  Echowrap.artist_songs(:id => artist.id, :results => 20).each do |song|
    puts "Song = #{song.inspect}"
  end
end

exit 
Echowrap.artist_search(:name => 'Jethro Tull', :results => 1).each do |artist|
  puts "Artist is #{artist.name}"
  puts "Artist is #{artist.name}"

  Echowrap.artist_songs(:id => artist.id, :results => 20).each do |song|
    puts "Song = #{song.inspect}"
  end
end
