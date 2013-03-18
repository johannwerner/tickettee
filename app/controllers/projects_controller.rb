class ProjectsController < ApplicationController
	
	def create
		@project = Project.new(params[:project])
		@project.save
		flash[:notice] = ""
		redirect_to @project
	end

	def index

	end

	def new
		@project = Project.new
	end
end
