# -*- encoding : utf-8 -*-
class Category < ActiveRecord::Base
  has_many :projects
  has_many :post_categories, :dependent => :destroy
  has_many :posts, :through => :post_categories
  is_sluggable :name

  validates :name, :presence => true
  default_scope :order => 'name'
end