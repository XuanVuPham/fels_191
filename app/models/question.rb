class Question < ApplicationRecord
  belongs_to :category
  has_many :answers, dependent: :destroy
  has_many :results
  validates :name, presence: true
  has_many :lessons, through: :results

  scope :random, ->{order "RANDOM()"}
  scope :newest, -> {order created_at: :desc}
  accepts_nested_attributes_for :answers, allow_destroy: true
end
