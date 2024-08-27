class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :postage_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :shipping_day_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :price, presence: true, 
    numericality:{ greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "must be between 300 and 9999999" },
    format: { with: /\A[0-9]+\z/, message: "must be a number" }
  validates :user, presence: true

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :shipping_day
end
