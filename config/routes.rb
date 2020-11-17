Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


root "pages#index"
get "/project_assigned/:id", to: "pages#project_assigned"
devise_scope :user do
get 'users/sign_out' => "devise/sessions#destroy"
  end
    resources :projects	
    resources :bugs
    
end
