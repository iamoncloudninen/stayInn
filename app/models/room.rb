class Room < ApplicationRecord
    belongs_to :user
    has_many :reservations
    attachment :image
    validates :title, presence: true
    validates :body, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 1 }
    validates :address, presence: true
end
