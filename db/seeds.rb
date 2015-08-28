module UsersImporter
  def self.import
    5.times do
      User.create(name: Faker::Name.name, email: Faker::Internet.free_email, password: "12345")
    end
  end
end

module PropertiesImporter
  def self.import
    5.times do
      Property.create(title: "Property for booking", description: Faker::Company.catch_phrase, address: Faker::Address.street_address, price: Faker::Commerce.price, user_id: [1,2,3,4,5].sample)
    end
  end
end

module TagsImporter
  def self.import
    5.times do
      Tag.create(name: Faker::Address.state)
    end
  end
end

module PropertyTagsImporter
  def self.import
    5.times do
      PropertyTag.create(tag_id: [1,2,3,4,5].sample, property_id: [1,2,3,4,5].sample)
    end
  end
end