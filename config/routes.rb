AtividadesComplementares::Application.routes.draw do
  	

	LOCALES = /en|pt\-BR/

  	scope "(:locale)", :locale=>LOCALES  do
	  	resources :atividades
		devise_for :avaliadores
	end

  	match '/:locale'=>'welcome#index',:locale=>LOCALES

  	root :to => "welcome#index"
end
