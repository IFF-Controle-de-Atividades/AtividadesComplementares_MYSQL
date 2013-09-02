AtividadesComplementares::Application.routes.draw do
  	LOCALES = /en|pt\-BR/

	scope "(:locale)", :locale=>LOCALES  do
	  	resources :atividades
		devise_for :alunos
		devise_for :avaliadores
		resources :avaliadores,  only: [:index, :new,:create,:edit,:update]

		authenticated :avaliador do
    		root to: "avaliadores#index"
  		end

  		authenticated :aluno do
    		root to: "alunos#index"
  		end
	end

  	match '/:locale'=>'welcome#index',:locale=>LOCALES
  	root :to => "welcome#index"
end