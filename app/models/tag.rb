class Tag < ActiveRecord::Base
	validates_uniqueness_of :name
	has_many :taggings, :dependent => :destroy
	has_many :posts , :through =>:taggings
	
	def self.with_names(names)
    names.map do |name|
      Tag.find_or_create_by_name(name)
    end
  end
end
