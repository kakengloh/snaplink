class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.string :title
      t.string :slug
      t.string :short_url
      t.string :target_url
      t.integer :clicks, default: 0

      t.timestamps

      t.index :slug, unique: true
    end
  end
end
