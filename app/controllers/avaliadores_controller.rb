# --*-- coding:utf-8 --*--

class AvaliadoresController < ApplicationController
  before_filter :authenticate_avaliador!
  before_filter :current_avaliador

  def index
    @title = "Home"
  end

  def new
    if current_avaliador.admin
      @avaliador = Avaliador.new
    end

    unless current_avaliador.admin
       redirect_to avaliadores_index_path, :notice => I18n.t('avaliadores.notifications.admin_error')
    end  
  end

  def create
    @avaliador = Avaliador.new(params[:avaliador])
    if @avaliador.save
      redirect_to avaliadores_index_path, :notice => I18n.t('avaliadores.notifications.successfully_registrated', :user_name=> @avaliador.nome)
    else
      render :action => :new
    end
  end

  #### Metodos para editar o Status de determinado avaliador #####

    def status
        @avaliador = Avaliador.find(params[:id])
        @admin = current_avaliador
    end

    def update_status
        @avaliador = Avaliador.find(params[:id])
        @admin = current_avaliador
        if @avaliador.update_attributes(params[:avaliador])
            redirect_to total_avaliadores_path
            flash[:notice] = "Status  - atualizado"
        else
            render action: :edit
        end
    end

  #################################################################

  #### Localizador de elementos(aluno:, avaliador:, atividade:) ###

    def localizar_atividade
      @atividade_aluno = Atividade.where(:avalidor_id => current_avaliador.id ).paginate(
      :page => params[:page], :per_page=>5)
    end

    def total_alunos
      @alunos = Aluno.paginate(:page => params[:page], :per_page=>10)
    end

    def total_avaliadores
      @avaliadores = Avaliador.paginate(:page => params[:page], :per_page=>10)
    end
    
    def listar_atividades
      @atividades = Atividade.paginate(:page => params[:page], :per_page=>4)
    end

  #################################################################

  ##### Methods for load and remove the profile image #############

    def profileImage
      @avaliador = Avaliador.find(params[:id])
    end

    def reloadProfile
      @avaliador = Avaliador.find(params[:id])
      if @avaliador.update_attributes(params[:avaliador])
        redirect_to avaliadores_index_path, :notice => I18n.t('avaliadores.notifications.successfully_registrated', :user_name=> @avaliador.nome)
      else
        render action: :index
      end
    end

    def remove_imageProfile
        @avaliador = current_avaliador
        @avaliador.remove_image!
        @avaliador.remove_image = true
        if @avaliador.save
            flash[:notice] = "Sua imagem foi removida com sucesso"
            redirect_to avaliadores_index_path
        end
    end
  #################################################################

end