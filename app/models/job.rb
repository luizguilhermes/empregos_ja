class Job < ApplicationRecord
	belongs_to :company	
	validates :title, :location, :description, :category, presence: true
end
