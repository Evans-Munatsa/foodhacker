Rails.application.routes.draw do
  root 'static_pages#home'
  get 'static_pages/about'
  get 'static_pages/contact'
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users


  resources :products do
  	resources :comments
  end
end
