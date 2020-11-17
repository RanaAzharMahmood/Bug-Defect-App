class BugsController < ApplicationController


	def show
		@bug=Bug.find(params[:id])
		@id= @bug.project.id
	end

	def new 
		@bug=Bug.new
	end

	def create
		@bug=Bug.new(bug_params)
		@bug.status="new"
		@bug.project=Project.find(params.dig(:bug, :project_id))
		@bug.user=current_user
		if @bug.save
			redirect_to project_path(@bug.project)
		else
			render 'new'
		end
	end

	def destroy
		@bug=Bug.find(params[:id])
		@project=@bug.project
		@bug.destroy
		redirect_to project_path(@project)
	end
	def edit
		@bug=Bug.find(params[:id])
	end


	def update 
		@bug=Bug.find(params[:id])	
		if @bug.update(bug_params)
			redirect_to project_path(@bug.project)
		else
			render 'edit'
		end

	end
	private

		def bug_params
			params.require(:bug).permit(:title,:description,:bug_type,:deadline,:image,:status)
		end
end
