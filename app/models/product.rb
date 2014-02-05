class Product < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	
	validates :title, presence: true	
	validates :title, length: {maximum: 120}
	validates :category_id, presence: true
	validates :target_group, presence: true
	validates :size, presence: true

	mount_uploader :image, ImageUploader

	
end
