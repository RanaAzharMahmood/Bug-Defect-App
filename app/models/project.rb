class Project < ApplicationRecord

	validates :projectname, presence: true

	has_many :user_projects , dependent: :destroy
	has_many :users , through: :user_projects
	has_many :bugs	, dependent: :destroy	
	belongs_to :manager, class_name: "User"
end
