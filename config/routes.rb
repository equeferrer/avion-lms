Rails.application.routes.draw do
  get '/batches'          => 'batches#index'
  get '/batches/new'      => 'batches#new'
  post '/batches'         => 'batches#create',  as: 'batch_create'
  get '/batches/:id'      => 'batches#show',    as: 'batch_show'
  get 'batches/edit/:id'  => 'batches#edit',    as: 'batch_edit'
  patch 'batches/:id'     => 'batches#update',  as: 'batch_update'
  delete 'batches/:id'    => 'batches#destroy', as: 'batch_delete'

  get "pages/:page" => "pages#show"
  root to: "pages#show", page: "home", as: :root

  devise_for :students, path: '',
    controllers: { registrations: "students/registrations" }
  devise_for :admins, path: 'admins',
    controllers: { registrations: "admins/registrations" }

  # Dashboard Paths
  get 'dashboard' => "students#dashboard", as: :student_dashboard
  get 'admins/dashboard' => "admins#dashboard", as: :admin_dashboard

  resources :students
  resources :admins

end
