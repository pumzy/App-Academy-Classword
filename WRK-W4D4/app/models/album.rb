# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  band_id    :integer          not null
#  venue      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ActiveRecord::Base
validates :name, :band_id, :venue, presence:true

def self.venues
  %w(studio live)
end

belongs_to :band

has_many :tracks, dependent: :destroy


end
