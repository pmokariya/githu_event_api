class Repo < ApplicationRecord
    has_many :events, dependent: :destroy
end
