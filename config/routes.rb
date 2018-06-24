Rails.application.routes.draw do
  root to: 'entries#index'

  controller :statics do
    get :about
  end

  resources :entries, only: [:index, :show] do
    collection do
      get :feed, defaults: {format: :rss}
    end
  end

  resource :session, only: :new do
    get :refresh
  end
end
