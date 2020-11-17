class ProjectsController < ApplicationController

	helper_method :qa_present,:developer_present
	
	def index
		@projects=Project.all
	end
	def show
		@project=Project.find(params[:id])	
		@user_present=[]
	end
	

	def qa_present
		user= User.where(role: "qa")
			user.each do |project_user|
				if !@project.users.include? project_user 
					@user_present.push(*project_user)
				end
		end
	end
	def developer_present
		user= User.where(role: "developer")
			user.each do |project_user|
				if !@project.users.include? project_user 
					@user_present.push(*project_user)
				end
		end
	end

	def new 
		@project=Project.new
	end

	def create
		@project=Project.new(project_params)
		@project.manager=current_user
		if @project.save
			flash[:notice]="Project Created Successfully"
			redirect_to project_path(@project)
		else
			render 'new'
		end
	end

	def destroy
		@project=Project.find(params[:id])
		if params.dig(:user,:user_id).present?
			@project.users.destroy(params.dig(:user,:user_id))
			redirect_to project_path(@project)
		
		elsif params.dig(:user,:user_id).nil?
			 @project.destroy
			 flash[:notice]="Project Deleted Successfully"
			 redirect_to projects_path()
		else
			flash[:danger]="An error occured"
			redirect_to project_path(@project)
		end
		
	end


	def update
		@project=Project.find(params[:id])
	
		if params.dig(:user,:user_id).present?
			@project.users  <<  User.find(params.dig(:user,:user_id))
			if @project.save
				redirect_to project_path(@project)
			end
		else
			if params.dig(:project,:projectname).present?		
				if @project.update(project_params)
					flash[:notice] = "Project Updated Successfully"
					redirect_to project_path(@project)
				end
			else
				flash[:danger]="An Error Occured"
				redirect_to project_path(@project)
			end

		end

		
	end

	def edit
		@project=Project.find(params[:id])
	end

	private 
		def project_params
			params.require(:project).permit(:projectname)
		end
		def user_params
			params.require(:user).permit(:user_id)
		end


end