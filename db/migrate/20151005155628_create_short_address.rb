class CreateShortAddress < ActiveRecord::Migration
  def change
    create_table :short_addresses do |t|
      t.string :ip_address
      t.integer :no_of_clicks,  :default => 1
      t.belongs_to :short_link
      t.timestamps null: false
    end
  end

end
