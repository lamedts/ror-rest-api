class Origin < ApplicationRecord
    belongs_to :order, dependent: :destroy
    validates_presence_of :latitude, :longtitude
end
