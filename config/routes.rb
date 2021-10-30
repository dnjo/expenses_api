Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :time_periods, except: %i[new edit] do
    resources :expense_statuses, except: %i[new edit]
  end

  resources :expenses, except: %i[new edit]
end
