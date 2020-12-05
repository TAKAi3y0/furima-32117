class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :area
  belongs_to :category
  belongs_to :charge
  belongs_to :send_date
  belongs_to :status
  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :price, format: {
      with: /\A-?[0-9]+(\.[0-9]+)?\z/,
      message: 'Half-width number'
    }, numericality: {
      greater_than_or_equal_to: 300,
      less_than_or_equal_to: 9_999_999,
      message: 'Out of setting range'
    }
  end

  validates :category_id, :status_id, :charge_id, :area_id, :send_date_id, numericality: { other_than: 1, message: 'Select' }
end
