class CompaniesController < ApplicationController

	def show
		@company = Company.find(params[:id])
		@jobs = @company.jobs
		if @jobs.empty?
			flash.now[:notice] = "Nenhuma vaga disponível"
		end	
	end

	def new
		@company = Company.new
	end

	def create
		@company = Company.new(company_params)
		if @company.save
			redirect_to @company
		else
			render 'new'			
		end
	end

	private

	def company_params
		params.require(:company).permit(:name, :location, :mail, :phone)
	end
end