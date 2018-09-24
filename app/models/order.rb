class Order < ApplicationRecord
    has_one :destination, dependent: :destroy
    has_one :origin, dependent: :destroy
    validates_presence_of :status
end
