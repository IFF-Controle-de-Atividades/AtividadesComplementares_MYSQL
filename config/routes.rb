AtividadesComplementares::Application.routes.draw do
  	LOCALES = /en|pt\-BR/

  	scope "(:locale)", :locale=>LOCALES  do
	  	resources :atividades
		devise_for :avaliadores, skip: [:sessions]
		resources :avaliadores,  only: [:index, :new,:create,:edit,:update]
	end

  	match '/:locale'=>'welcome#index',:locale=>LOCALES

  	root :to => "welcome#index"
end
