# == Schema Information
#
# Table name: artists
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  bio        :text
#  city       :string(255)
#  country    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Artist < ActiveRecord::Base

  def self.get_info(name)

    artist = Echowrap.artist_search(:name => name,
                                    :bucket => ['hotttnesss', 'familiarity', 'artist_location', 'songs'],
                                    :results => 1).first
#     puts "Name: #{artist.inspect}"
#     puts "Name: #{artist.name}"
#     puts "City: #{artist.location.city}"
#     puts "Country: #{artist.location.country}"
#     artist.songs.each do |song|
#       puts "Song: #{song.title}"
#     end

    Artist.create(name: artist.name, city: artist.location.city, country: artist.location.country)
    artist.songs.each do |song|
      Song.create(name: song.title)
    end
  end
end
