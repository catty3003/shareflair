class Product < ActiveRecord::Base
	belongs_to :user, class_name: "Task", foreign_key: "user_id"
	validates :title, presence: true
	validates :category, presence: true
	validates :target_group, presence: true
	validates :size, presence: true

	mount_uploader :image, ImageUploader
end
