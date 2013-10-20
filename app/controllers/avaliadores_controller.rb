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
       redirect_to avaliadores_index_path, :alert => I18n.t('avaliadores.notifications.admin_error')
    end  
  end

  def create
    @avaliador = Avaliador.new(params[:avaliador])
    if @avaliador.save
      AvaliadorMailer.new_avaliador_send_mail(@avaliador).deliver
      redirect_to total_avaliadores_path, :notice => I18n.t('avaliadores.notifications.successfully_registrated', :user_name=> @avaliador.nome)
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
            redirect_to total_avaliadores_path, :notice => I18n.t('avaliadores.notifications.status_successfully_updated')
        else
            render action: :status
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
      if @alunos.empty?
        redirect_to avaliadores_index_path, :alert => I18n.t('messages.without_students')
      end
    end

    def total_avaliadores
      @avaliadores = Avaliador.paginate(:page => params[:page], :per_page=>10)
    end
    
    def listar_atividades
      @atividades = Atividade.paginate(:page => params[:page], :per_page=>4)
    end

    def live_search
      @tasks = Aluno.find(:all, :conditions => ["nome LIKE ? or email LIKE ?","%#{params[:live_search]}%","%#{params[:live_search]}%"])
      # @tasks  = Aluno.find( :all, :conditions => ["nome=? or email=?", params[:live_search], params[:live_search]])
    end

  #################################################################

  ##### Methods for load and remove the profile image #############
    
    def myimage
        @avaliador = Avaliador.find(params[:id])
    end

    def saveimage
        @avaliador = Avaliador.find(params[:id])
        if @avaliador.update_attributes(params[:avaliador])
            redirect_to avaliadores_index_path, :notice => I18n.t('avaliadores.notifications.successfully_registrated', :user_name=> @avaliador.nome)
        else
            render action: :myimage
        end
    end

    def removeimage
        @avaliador = current_avaliador
        @avaliador.remove_image!
        @avaliador.remove_image = true
        if @avaliador.save
            redirect_to avaliadores_index_path, :notice => I18n.t('avaliadores.notifications.image_deleted', :user_name=> @avaliador.nome)
        end
    end
  #################################################################

  ################# Métodos para alterar a senha ##################

    def mypassword
      @avaliador = current_avaliador
    end

    def updatepassword
      @avaliador = Avaliador.find(current_avaliador.id)
      if @avaliador.update_attributes(user_params)
        sign_in @avaliador, :bypass => true
        redirect_to avaliadores_index_path, :notice => t('avaliadores.notifications.password_successfully_updated', :user_name=> @avaliador.nome)
      else
        render action: :mypassword
      end
    end

  #################################################################

  private
    def user_params
      # NOTE: Using 'strong_parameters' gem
      params.require(:avaliador).permit(:password, :password_confirmation)
    end
end