class PagesController < ApplicationController


	def index
	
	end
	
	def project_assigned
		@user=User.find(params[:id])
	end

	def add_developer
	end

	def add_qa
	end
	
end
