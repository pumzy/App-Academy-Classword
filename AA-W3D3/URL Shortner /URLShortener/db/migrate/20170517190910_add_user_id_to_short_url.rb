class AddUserIdToShortUrl < ActiveRecord::Migration
  def change
    add_column(:short_urls, :user_id, :integer, null:false)
  end
end
