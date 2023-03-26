class CreateLinkVisits < ActiveRecord::Migration[7.0]
  def change
    create_table :link_visits do |t|
      t.references :link, foreign_key: true

      t.string :user_agent
      t.string :referrer
      t.string :ip_address
      t.string :device
      t.string :country
      t.string :city

      t.timestamps
    end
  end
end
