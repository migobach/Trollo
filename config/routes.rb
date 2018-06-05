Rails.application.routes.draw do
  
  root 'boards#index'

  resources :boards do 
    resources :lists
  end

  scope 'tasks/:task_id', as: 'task' do
    resources :body, :priority, only: [:new, :edit, :create, :update, :delete]
  end
end
