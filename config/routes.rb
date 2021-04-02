Rails.application.routes.draw do
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
  devise_for :admins
  devise_for :students
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
