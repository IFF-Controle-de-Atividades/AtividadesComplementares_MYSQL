# --*-- coding:utf-8 --*--
AtividadesComplementares::Application.routes.draw do
  LOCALES = /en|pt\-BR/

  scope "(:locale)", :locale=>LOCALES do
    resources :avaliadores, :only => [:new, :create, :total_alunos, :total_avaliadores,:listar_atividades, :listar_avaliacoes, :select_image]
    resources :alunos,      :only => [:index, :profileimage, :changeimage, :removeimage, :password,:changepassword]
    resources :atividades

    devise_for :alunos,      :skip => [:sessions]
    devise_for :avaliadores, :skip => [:sessions]
  end

  as :aluno do
     get "/user/sign_in" => "devise/sessions#new", :as => :new_aluno_session
     post "/user/sign_in" => "devise/sessions#create", :as => :aluno_session
     get "/user/sign_out" => "devise/sessions#destroy", :as => :aluno_session_out
     get "/user/home/" => "alunos#home", :as => :aluno_home
     get "/listadeatividades" => "alunos#atividades", :as => :listadeatividades
     get "/imagemdoperfil"  => "alunos#profileimage", :as => :profile_image
     get "/imagemdoperfilpadrao"=> "alunos#removeimage", :as => :default_image
     get "/alterarsenha/:id"=> "alunos#password", :as => :password
  end

  as :avaliador do
     post "/avaliador/sign_in" => "devise/sessions#create", :as => :avaliador_session
     get "/avaliador/sign_in" => "devise/sessions#new", :as => :new_avaliador_session
     get "/avaliador/sign_out" => "devise/sessions#destroy",:as => :avaliador_session_out
     get "/avaliador/sign_up" => "avaliadores#new", :as => :novo_avaliador_cadastro
     get "/avaliador/index" => "avaliadores#index", :as => :avaliadores_index
     get "/adim/TOTAL_AVALIADORES" => "avaliadores#total_avaliadores", :as => :total_avaliadores
     get "/adim/TOTAL_ALUNOS" => "avaliadores#total_alunos", :as => :total_alunos
     get "/lista-de-avaliacoes/:id" => "avaliadores#exibir_avaliacoes", :as => :lista_de_avaliacoes
     get "/TOTAL_ATIVIDADES" => "avaliadores#total_alunos", :as => :total_atividades
     get "/TOTAL_AVALIACOES" => "avaliadores#listar_avaliacoes", :as => :total_avaliacoes
     get "/admin/geracao_de_relatorio/pdf" => "avaliadores#relatorios_pdf", :as => :admin_relatorio_em_pdf

     match "/lista-de-atividades/:id", :controller => "avaliadores", :action=>"atividades"
     match "/localizar-atividades", :controller => "avaliadores", :action=>"localizar_atividade", :as=>:localizar_atividades
     match "/avaliar_atividade/:id/avaliar_atividade", :controller => "avaliadores", :action=>"avaliar_atividade", :as => :avaliar_atividade
     match "/avaliar_atividade/:id/avaliar", :controller => "avaliadores", :action=>"avaliar", :as => :update_avaliar_atividade
     match "/avaliador/editar_status/:id", :controller => "avaliadores", :action =>"status", :as => :editar_avaliador_status
     match "/avaliador/edit_status/:id/atualizar_status", :controller => "avaliadores", :action =>"update_status", :as => :atualizar_avaliador_status
     match "/avaliador/:id/Profileimagem",:controller => "avaliadores", :action=>"profileImage", :as => :selecionar_imagem_avaliador
     match "/avaliador/:id/salvar_imagem",:controller => "avaliadores", :action=>"reloadProfile", :as => :salvar_imagem_avaliador
     match "/avaliador/:id/remover_imagem",:controller => "avaliadores", :action=>"remove_imageProfile", :as => :remover_imagem_avaliador
     match "/designar-avaliador/atividade/:id/avaliar",:controller => "avaliadores", :action => "avaliar", :as => :designar_atividade
  end

  get "/minhas-atividades" => "pdf_reports#atividadealuno", :format=> :pdf, :as=>:alunoatividades
  get "/total-avaliadores" => "pdf_reports#avaliadores_pdf", :format => :pdf, :as=> :avaliadores_pdf
  get "/total-alunos" => "pdf_reports#alunos_pdf", :format => :pdf, :as=> :alunos_pdf
  get "/total-atividades" => "pdf_reports#total_atividades", :format => :pdf, :as=> :total_atividades

  match "/atividades/:id/delete", :controller => "atividades", :action => "destroy", :as => :excluir_atividade
  resources :pdf_reports, :only => [:pdf_reports, :avaliadores_report, :alunos_report, :atividades_report, :relatorioAtividades_report]

  get "/pdf_reports/menu"
  get "/pdf_reports/avaliadores_report" => "pdf_reports#avaliadores_report", :format => :pdf
  get "/pdf_reports/alunos_report" => "pdf_reports#alunos_report", :format => :pdf
  get "/pdf_reports/atividades_report" => "pdf_reports#atividades_report", :format => :pdf
  get "/pdf_reports/total_de_atividades" => "pdf_reports#relatorioAtividades_report",  :format => :pdf, :as=>:pdf_reports_relatorioAtividades

  authenticated :aluno do
    root :to => "alunos#index"
  end

  authenticated :avaliador do
    root to: "avaliadores#index"
  end

  match '/:locale'=>'welcome#index',:locale=>LOCALES
  root :to => "welcome#index"
end

