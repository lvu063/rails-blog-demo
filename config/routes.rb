Rails.application.routes.draw do`n  root "articles#index"`n  resources :articles do`n    resources :comments, only: [:create, :destroy]`n  end`nend
