class CreateShortUrls < ActiveRecord::Migration
  def change
    create_table :short_urls do |t|
      t.string :short_url
      t.string :long_url, null:false
      t.timestamps
    end
  end
end
