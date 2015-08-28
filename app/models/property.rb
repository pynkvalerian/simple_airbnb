class Property < ActiveRecord::Base
  belongs_to :user
  has_many :property_tags
  has_many :tags, through: :property_tags

  def self.list_user_property(user_id)
    @properties = Property.where(user_id: user_id)
  end

  def self.existing_property?(address)
    property = Property.find_by(address: address)
    false if property.nil?
  end
end
