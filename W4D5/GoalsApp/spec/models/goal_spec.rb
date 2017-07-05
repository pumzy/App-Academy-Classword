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

require 'rails_helper'

RSpec.describe Goal, type: :model do
  describe "validations" do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:user)}
    it {should validate_presence_of(:private?)}
    it {should validate_presence_of(:completed?)}
  end

  



end
