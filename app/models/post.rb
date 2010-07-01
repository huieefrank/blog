class Post < ActiveRecord::Base
	
	has_many :comments, :dependent => :destroy
	has_many :taggings, :dependent => :destroy
	has_many :tags , :through => :taggings
	belongs_to :user
	
	
	
	validates_presence_of :title , :content ,:published_at
	validates_uniqueness_of :title
	named_scope :published, lambda { {:conditions => ['published_at <= ?', Time.now.utc]} }
    named_scope :unpublished, lambda { {:conditions => ['published_at > ?', Time.now.utc]} }
    named_scope :recent, :order => 'id DESC'
    named_scope :recently ,:order=>'id DESC' ,:limit =>10
    named_scope :broadcast  ,lambda{ {:conditions =>"users.role ='admin' ",
                                      :joins=> "inner join users on posts.user_id = users.id"} }
    def published_month
    published_at.beginning_of_month
    end
    
    def tag_names=(names)
    self.tags = Tag.with_names(names.split(/\s+/))
  	end
  
  	def tag_names
    	tags.map(&:name).join(' ')
  	end
    
end
