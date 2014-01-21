class Product < ActiveRecord::Base
	belongs_to :user
	validates :title, presence: true
	validates :category, presence: true
	validates :target_group, presence: true
	validates :size, presence: true

	mount_uploader :image, ImageUploader
end
