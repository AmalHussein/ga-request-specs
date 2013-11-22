# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  password_salt   :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

require 'spec_helper'

describe User do

  subject do
    User.create(email: 'foo@example.com', password: 'foo')
  end

  describe "with playlists" do
    let(:golden) do
      Song.create(name: 'Golden Age',
                  description: "The artist is Beck",
                  url: 'http://www.youtube.com/watch?v=Y6zAT15vaFk')
    end
    let(:playlist1) do
      pl = Playlist.create(name: 'rock', state: 'public')
      pl.songs << golden
      pl
    end

    before(:each) do
      subject.playlists << playlist1
    end
    it { should have(1).playlists }
  end

end
