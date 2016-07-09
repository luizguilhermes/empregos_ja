class JobsController < ApplicationController
	def new
		@job = Job.new
	end

	def create
		@job = Job.new(job_params)
		if @job.valid?
			@job.save
			redirect_to @job
		else
			flash[:notice] = "Não foi possível criar a vaga"
			render 'new'
		end
	end

	def show
		@job = Job.find(params[:id])
	end

	private

	def job_params
		params.require(:job).permit(:title, :location, :category, :company_id, :description, :featured)
	end

end
