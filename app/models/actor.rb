class Actor < ApplicationRecord
    has_many :events, dependent: :destroy
    validates :name, :email, presence: true
end
