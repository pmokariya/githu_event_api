class Event < ApplicationRecord
    belongs_to :repo
    belongs_to :actor 
end
