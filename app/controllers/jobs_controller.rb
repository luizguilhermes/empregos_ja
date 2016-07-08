class JobsController < ApplicationController
	def new
		@job = Job.new
	end

	def create
		@job = Job.create(job_params)
		redirect_to @job
	end

	def show
		@job = Job.find(params[:id])
	end

	private

	def job_params
		params.require(:job).permit(:title, :location, :category, :company_id, :description, :featured)
	end

end
