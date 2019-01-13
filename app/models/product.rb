class Product < ApplicationRecord
  has_many :reviews
  
  def review_average
    self.reviews.average(:evaluation).round
    
  end
  
end
