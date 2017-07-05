# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  album_id   :integer          not null
#  bonus      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ActiveRecord::Base
validates :name, :album_id, presence: true

belongs_to :album

has_one :band,
through: :album,
source: :band

end
