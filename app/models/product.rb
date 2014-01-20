class Product < ActiveRecord::Base
	validates :title, presence: true
	validates :category, presence: true
	validates :target_group, presence: true
	validates :size, presence: true
end
