require 'spec_helper'

feature "Artist" do

  background do

    stub_request(:get, "http://developer.echonest.com/api/v4/artist/search?api_key=T7VSIPFJKZDHOXZLD&bucket=songs&name=Radiohead&results=1").
      with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Echowrap Ruby Gem 0.1.0'})
#       .
#       to_return(:status => 200, :body => "", :headers => {})

  end
  
  scenario "get from echonest api" do
    Artist.get_info('Radiohead')
    Sound.count.should == 44
    
  end
end
