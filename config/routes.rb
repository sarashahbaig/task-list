Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root :to => "tasks#index"
  
  resources :tasks, only: [:index, :show, :new, :create, :edit, :update]
  # resources :tasks, except: [:name, :description]
  
# # Routes that operate on the task collection
#   get '/tasks', to: 'tasks#index', as: 'tasks'
# # Step 1: Create a view so that a user sees the New task Form
#   get '/tasks/new', to: 'tasks#new', as: 'new_task' 
# # Step 2: Create an action so that the form data actually gets processed by Rails (by the server) and creates that new task, and changes the database
#   post '/tasks', to: 'tasks#create'

# # Routes that operate on individual tasks
#   get '/tasks/:id', to: 'tasks#show', as: "task"

#   get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'

  #  patch '/tasks/update/:id', to: 'tasks#update', as: 'task_update'

  delete '/tasks/:id', to: 'tasks#destroy', as: 'task_delete'

  get '/tasks/complete/:id', to: 'tasks#toggle_complete', as: 'complete_task'

end


# resources :books


# the syntax for generating the seven conventional REST

