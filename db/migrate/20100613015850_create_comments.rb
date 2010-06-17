class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.belongs_to :post
      t.string :name
      t.text :content
      t.string :email
      t.string :site_url

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
