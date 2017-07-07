class Cocktail < ApplicationRecord
	has_many :ingredients, through: :doses
	has_many :doses, dependent: :destroy 
	validates :name, presence: true, uniqueness: true 
	mount_uploader :cocktail_img, CocktailImgUploader
end
