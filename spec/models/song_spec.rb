# == Schema Information
#
# Table name: songs
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  url         :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Song do
  subject {   Song.create(name: 'Golden Age', description: "The artist is Beck", url: 'http://www.youtube.com/watch?v=Y6zAT15vaFk') }

  its(:name) {should == "Golden Age" }
end
