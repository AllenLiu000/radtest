Rails.application.routes.draw do
  root 'static_pages#home'
  post 'static_pages/changeState'
end
