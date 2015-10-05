class CreateShortLinks < ActiveRecord::Migration
  def change
    create_table :short_links do |t|
      t.string :base_url
      t.string :short_url
      t.integer :no_of_clicks,  :default => 0

      t.timestamps null: false
    end
  end

end
