Rails.application.routes.draw do
  get '/batches'          => 'batches#index'
  get '/batches/new'      => 'batches#new'
  post '/batches'         => 'batches#create',  as: 'batch_create'
  get '/batches/:id'      => 'batches#show',    as: 'batch_show'
  get 'batches/edit/:id'  => 'batches#edit',    as: 'batch_edit'
  patch 'batches/:id'     => 'batches#update',  as: 'batch_update'
  delete 'batches/:id'    => 'batches#destroy', as: 'batch_delete'
  devise_for :students, path: '',
    controllers: { 
      sessions: "student/sessions",
      registrations: "student/registrations",
      passwords: "student/passwords"
    }
  devise_for :admins, path: 'admin',
    controllers: { 
      sessions: "admin/sessions",
      registrations: "admin/registrations",
      passwords: "admin/passwords"
    }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
