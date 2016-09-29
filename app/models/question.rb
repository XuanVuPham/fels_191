class Question < ApplicationRecord
  belongs_to :category
  has_many :anwsers
  has_many :results
  has_many :lessons, through :result
end
