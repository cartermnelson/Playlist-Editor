Rails.application.routes.draw do
  get 'main' => 'users#new'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'
  post 'users' => 'users#create'
  get 'users/:id' => 'users#show'

  get 'songs' => 'songs#index'
  post 'songs' => 'songs#create'
  get 'songs/:id' => 'songs#show'

  post 'songs/:song_id/listeners' => 'listeners#create'

  match '' => redirect('/songs'), via: :get #send root route to /main instead of rails welcome page
  match '*path' => redirect('/songs'), via: :get #send all unknown routes to /main
end
