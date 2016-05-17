class Post < ActiveRecord::Base
	
	has_many :uploads , as: :uploadable
	has_many :comments
	accepts_nested_attributes_for :uploads, :allow_destroy => true


	def self.search(search, page)
  		paginate :per_page => 4, :page => page         
	end

	# def self.posts_by_paginate
 #    paginate(:all, :per_page => 25, :conditions => ["published = ?", true])
 #  end
 
end
