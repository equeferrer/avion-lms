Rails.application.routes.draw do
  get 'progresses/new'
  get 'progresses/create'
  get 'progresses/show'
  get 'progresses/edit'
  get 'progresses/update'
  get '/lessons'          => 'lessons#index'
  get '/lessons/new'      => 'lessons#new'
  post '/lessons'         => 'lessons#create',  as: 'lesson_create'
  get '/lessons/:id'      => 'lessons#show',    as: 'lesson_show'
  get 'lessons/edit/:id'  => 'lessons#edit',    as: 'lesson_edit'
  patch 'lessons/:id'     => 'lessons#update',  as: 'lesson_update'
  delete 'lessons/:id'    => 'lessons#destroy', as: 'lesson_delete'
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
