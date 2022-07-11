Rails.application.routes.draw do
  scope "api/v1", format: :json do
    resources :boards do
      post "/move-task", to: "tasks#move_task"
      post "/move-column", to: "columns#move_column"
      resources :columns do
        resources :tasks
      end
    end
  end
end
