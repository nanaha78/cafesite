class AddYoutubeUrlToDogs < ActiveRecord::Migration[6.1]
  def change
    add_column :dogs, :youtube_url, :string
  end
end
