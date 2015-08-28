# DISPLAY INDIVIDUAL PROPERTY PAGE
get '/property/:id' do
  @property = Property.find(params[:id])
  erb :property
end

# CREATE NEW PROPERTY AND ASSOCIATED TAGS
post '/add_new_property' do
  title = params[:title]
  description = params[:description]
  address = params[:address]
  price = params[:price]

  # CHECK IF PROPERTY ALREADY LISTED
  if Property.existing_property?(address) == false
    @new_property = Property.create(title: title, description: description, address: address, price: price, user_id: session[:user_id])

    # ASSOCIATE TAGS TO PROPERTY
    params[:tags].split(",").each do |tag|
      @tag = Tag.find_or_create_by(name: tag)
      @tag.properties << @new_property
    end

     redirect to('dashboard')
  else
    redirect to('/dashboard')
  end
end

# GO TO EDIT PROPERTY PAGE
get '/property/:property_id/edit' do
  user_id = session[:user_id]

  @current_user = User.find(user_id)
  @current_property = Property.find(params[:property_id])
  erb :edit
end

#EDIT EXISTING PROPERTY
post '/property/:property_id/edit' do
  property = Property.find(params[:property_id])

  title = params[:title]
  description = params[:description]
  address = params[:address]
  price = params[:price]

  property.update(title: title, description: description, address: address, price: price)
   redirect to('dashboard')
end

#DELETE EXISTING PROPERTY
post '/property/:id/delete' do
  property = Property.find(params[:id])
  all_bookings = property.bookings
  if property.nil? == false
    #DELETE BOOKING AS WELL
    all_bookings.each do |booking|
      booking.delete
    end
    property.delete
  end
  redirect to('/dashboard')
end


