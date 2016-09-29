class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :results
  has_many :questions, through :result
end
