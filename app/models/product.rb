class Product < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	validates :title, presence: true
	validates :category_id, presence: true
	validates :target_group, presence: true
	validates :size, presence: true

	mount_uploader :image, ImageUploader

	def find_man
		Product.all.find_all_by_category(Gentlemen) 
	end
		
	
end
