class Post < ActiveRecord::Base
	
	has_many :comments, :dependent => :destroy
	
	validates_presence_of :title , :content ,:published_at
	named_scope :published, lambda { {:conditions => ['published_at <= ?', Time.now.utc]} }
    named_scope :unpublished, lambda { {:conditions => ['published_at > ?', Time.now.utc]} }
    named_scope :recent, :order => 'id DESC'
    named_scope :recently ,:order=>'id DESC' ,:limit =>10
    def published_month
    published_at.beginning_of_month
    end
    
end
