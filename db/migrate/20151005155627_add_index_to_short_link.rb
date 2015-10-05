class AddIndexToShortLink < ActiveRecord::Migration
  add_index :short_links, :short_url
end
