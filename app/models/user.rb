class User < ApplicationRecord
	enum role: [:manager, :developer, :qa]

	validates :name,presence: true
	validates_uniqueness_of :email, presence: true

	has_many :bugs	
	has_many :user_projects , dependent: :destroy
	has_many :projects, through: :user_projects
	has_many :subordinates, class_name: "User", foreign_key: "manager_id"
	belongs_to :manager, class_name: "User", optional: true

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :validatable
end
