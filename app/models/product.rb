class Product < ApplicationRecord
	has_one :picture, as: :imageable
	accepts_nested_attributes_for :picture
end
