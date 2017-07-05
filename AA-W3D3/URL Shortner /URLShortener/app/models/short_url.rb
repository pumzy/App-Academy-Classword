require 'securerandom'
require 'byebug'
# == Schema Information
#
# Table name: short_urls
#
#  id         :integer          not null, primary key
#  short_url  :string
#  long_url   :string           not null
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer          not null
#

class ShortUrl < ActiveRecord::Base
  validates :long_url, presence: true
  validates :short_url, :long_url, uniqueness: true

  belongs_to :submitter,
  class_name: :User,
  primary_key: :id,
  foreign_key: :user_id

  def self.random_code
    code = SecureRandom::urlsafe_base64
    until self.exists?(long_url: code) == false
      code = SecureRandom::urlsafe_base64
    end

    code
  end

  def self.create!(options)
    short_code = self.random_code
    ShortUrl.create( long_url:options[:long_url], short_url: short_code, user_id:options[:user_id])
  end

  def find_visits_by_id
    Visit.where(short_url_id: self.id)
  end

  def num_clicks
    find_visits_by_id.count
    # Visit.all.select { |item| item.short_url_id == self.id }.count
  end

  def num_uniques
    find_visits_by_id.select(:user_id).distinct.count
    #Visit.all.select { |item| item.short_url_id == self.id }.map {|item| item.user_id}.uniq.count
  end

  def num_recent_uniques
    find_visits_by_id
      .where("created_at > ? ", 10.minute.ago)
      .select(:user_id)
      .distinct
      .count
  end

end
