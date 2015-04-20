class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :message, null: false
      t.string :query, null: false
      t.string :owner, null: false
      t.string :owner_avatar_url, null: false
      t.datetime :tweeted_at, null: false
      t.timestamps
    end
  end
end
