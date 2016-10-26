Rails.application.routes.draw do
  resources :doctors, path: '/api/doctors'
  resources :patients, path: '/api/patients'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
