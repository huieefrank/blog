class Comment < ActiveRecord::Base
	belongs_to :post, :counter_cache => true
    
	validates_presence_of :name, :content, :post_id
	named_scope :recent, :order => "created_at DESC"
	
	
end
