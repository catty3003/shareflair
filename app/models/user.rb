class User < ActiveRecord::Base
	has_many :products, :dependent => :delete_all
	
	validates :username, presence:  true, uniqueness: true
	validates :city, presence:  true
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	mount_uploader :avatar, ImageUploader
end
