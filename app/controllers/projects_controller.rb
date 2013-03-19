class ProjectsController < ApplicationController
	before_filter :find_project, :only => [:show,
										   :edit,
											:update,
											:destroy]
	
	def create
		@project = Project.new(params[:project])
		if @project.save 
			flash[:notice] = "Project has been created."
			redirect_to @project
		else
			flash[:alert ] = "Project has not been created." 
			render :action => "new"
		end
	end

	def index
		@projects = Project.all
	end

	def new
		@project = Project.new
	end


	def edit
		@project = Project.find(params[:id])
	end

	def update
		@project = Project.find(params[:id])
		if @project.update_attributes(params[:project])
		flash[:notice] = "Project has been updated"
		redirect_to @project
	else
		flash[:alert] = "Project has not been updated"
		render :action => "edit"
	end


	def destroy
		@project = Project.find(params[:id])
		if @project.destroy
			flash[:notice] = "Project has been deleted"
			redirect_to projects_path
		else
			flash[:notice] = "Project has not been deleted"
		end
	end


	private
		def find_project
			@project = Project.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			flash[:alert] = "The project you were looking" + " for could not be found"
			redirect_to projects_path

		end
	end
end
