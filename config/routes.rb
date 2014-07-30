Rails.application.routes.draw do

  root 'main#index'

  get "/login" => "main#login_get"

  get "/sign_up" => "main#sign_up_get"

  post "/sign_up" => "main#sign_up_post"

  post "/login" => "main#login_post"

  get "/profile" => "main#profile"

  get "/logout" => "main#logout"

end
