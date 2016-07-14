class CompaniesController < ApplicationController
	before_action :find_company, only: [:show, :edit, :update]

	def show
		@jobs = @company.jobs
		if @jobs.empty?
			flash.now[:notice] = 'Nenhuma vaga disponível'
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

	def edit
	end

	def update
		if @company.update(company_params)
			redirect_to @company
		else
			flash.now[:notice] = 'Não foi possível atualizar a empresa'
			render 'edit'
		end
	end

	private

	def company_params
		params.require(:company).permit(:name, :location, :mail, :phone)
	end

	def find_company
		@company = Company.find(params[:id])
	end
end