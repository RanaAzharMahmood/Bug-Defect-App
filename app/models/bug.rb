class Bug < ApplicationRecord

	validates :title,presence: true, uniqueness: true
	validates :deadline,presence: true
	validates :status, presence: true
 	mount_uploader :image, ImageUploader
	belongs_to :project
	belongs_to :user
end