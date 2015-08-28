# BOOK PROPERTY WITH SELECTED DATES
post '/property/:property_id/book' do
  property = Property.find(params[:property_id])

# REDIRECT TO INDEX IF USER NOT LOGGED IN
    if session[:user_id].nil?
      redirect to ('/')

# DOES NOT ALLOW USER TO BOOK OWN PROPERTY
    else
      if property.user_id == session[:user_id]
        redirect to('/dashboard')

# CREATE BOOKING
      else
        start_date = Date.parse(params[:start_year] + "-" + params[:start_month] + "-" + params[:start_day])
        end_date = Date.parse(params[:end_year] + "-" + params[:end_month] + "-" + params[:end_day])
        Booking.create(start_date: start_date, end_date: end_date, user_id: session[:user_id], property_id: params[:property_id])
        redirect to ('/dashboard')
      end
    end

end