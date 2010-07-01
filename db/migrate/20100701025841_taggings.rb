class Taggings < ActiveRecord::Migration
  def self.up
  	create_table :taggings do |t|
      t.belongs_to :post
      t.belongs_to :tag
      t.timestamps
    end
  end

  def self.down
  	drop_table :taggings
  end
end
