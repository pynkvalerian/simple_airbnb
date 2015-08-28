class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :property

  def self.find_property(property_id)
    @property = Property.find(property_id)
  end
end
