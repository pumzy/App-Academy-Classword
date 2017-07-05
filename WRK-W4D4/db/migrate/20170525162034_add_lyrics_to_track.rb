class AddLyricsToTrack < ActiveRecord::Migration
  def change
    add_column :tracks, :lyrics, :string
  end
end
