# -*- encoding : utf-8 -*-
class AddIpToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :ip, :string
  end

  def self.down
    remove_column :comments, :ip
  end
end
