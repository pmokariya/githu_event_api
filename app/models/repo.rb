class Repo < ApplicationRecord
    has_many :events, dependent: :destroy
    validates :name, :link, presence: true
end
