AtividadesComplementares::Application.routes.draw do
  	LOCALES = /en|pt\-BR/

	scope "(:locale)", :locale=>LOCALES  do
	  	resources :atividades
		devise_for :alunos
		devise_for :avaliadores, skip: [:sessions]
		resources :avaliadores,  only: [:index, :new,:create,:edit,:update]

		devise_scope :avaliador do 
			get "/user/sessions/new" => "devise/sessions#new", :as => :new_avaliador_session
			post "/user/sessions/create" => "devise/sessions#create", :as => :avaliador_session
			get "/user/sessions/sign_out" => "devise/sessions#destroy",:as => :avaliador_session_out
		end

		devise_scope :aluno do 
			get "/user/sessions/new" => "devise/sessions#new", :as => :new_aluno_session
			post "/user/sessions/create" => "devise/sessions#create", :as => :aluno_session
			get "/user/sessions/sign_out" => "devise/sessions#destroy",:as => :aluno_session_out
		end

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