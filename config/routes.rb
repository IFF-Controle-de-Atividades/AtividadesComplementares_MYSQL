AtividadesComplementares::Application.routes.draw do
  resources :atividades
  root :to => "welcome#index"
end
