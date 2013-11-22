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

require 'spec_helper'

describe Artist do
  pending "add some examples to (or delete) #{__FILE__}"
end
