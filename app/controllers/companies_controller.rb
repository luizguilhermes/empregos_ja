class CompaniesController < ApplicationController

	def show
		@company = Company.find(params[:id])
	end

	def new
		@company = Company.new
	end

	def create
		@company = Company.new(company_params)
		@company.save

		if @company.valid?
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