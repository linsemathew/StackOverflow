get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    session['user_id'] = user.id
    redirect '/'
  else
    @errors = user.errors.full_messages
    erb :'/users/new'
  end
end

get '/users' do
  @all_users = User.all
  erb :'users/index'
end

get '/users/show' do
  @user = current_user
  erb :'users/show'
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end
