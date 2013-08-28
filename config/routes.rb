AtividadesComplementares::Application.routes.draw do
  devise_for :avaliadores

  resources :atividades
  root :to => "welcome#index"
end
