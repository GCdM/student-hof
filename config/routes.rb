Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  namespace :api do
    namespace :v1 do
      # STUDENTS
      get 'students', to: 'students#index'
      # post 'students', to: 'students#create'
      get 'students/:slug', to: 'students#show'
      # get 'students/:slug/edit', to: 'students#edit'
      # patch 'students/:slug', to: 'students#update'
      # delete 'students/:slug', to: 'students#destroy'
      
      # PROJECTS
      get 'projects', to: 'projects#index'
      # post 'projects', to: 'projects#create'
      get 'projects/:slug', to: 'projects#show'
      # get 'projects/:slug/edit', to: 'projects#edit'
      # patch 'projects/:slug', to: 'projects#update'
      # delete 'projects/:slug', to: 'projects#destroy'
      
      post 'admin', to: 'administrator#authenticate'
    end
  end
  
end
