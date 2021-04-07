class Event < ApplicationRecord
    belongs_to :repo
    belongs_to :actor 
    validates :event_type, :public, presence: true
end
