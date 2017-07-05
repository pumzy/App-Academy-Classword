# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  user_id    :integer          not null
#  steps      :text
#  private?   :boolean          default("true"), not null
#  completed? :boolean          default("false"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Goal < ActiveRecord::Base
  validates_presence_of :title, :user, :private?, :completed?

  belongs_to :user 

end
