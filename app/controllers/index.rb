get '/' do
  @properties = Property.all

  erb :index
end

post '/tags' do
  arr_tags = []
  tags = params[:tags]
  tags.each_key do |tag|
    arr_tags << tag
  end
  session[:tags] = arr_tags

  redirect to('/tags')
end

get '/tags' do
  @properties = []

  session[:tags].each do |tag|
    @tag = Tag.find_by name: tag
    @tag.properties.each do |property|
      @properties << property
    end
  end

  erb :index
end