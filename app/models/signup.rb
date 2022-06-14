class Signup < ApplicationRecord
    belongs_to :camper
    belongs_to :activity

    validates :time, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 23 }
    validates :camper_id, presence: true
    validates :activity_id, presence: true

end
