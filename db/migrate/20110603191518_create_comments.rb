# -*- encoding : utf-8 -*-
class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :author
      t.string :email
      t.string :url
      t.text :body
      t.integer :post_id
      t.boolean :published

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
