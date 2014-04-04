#--*-- coding:utf-8 --*--

'''
  ATIVIDADES CONTROLLER É RESPONSAVEL POR 
  EXPECIFICAR TODAS AS FUNCIONALIDADES DE 
  ATIVIDADES RELACIONADAS À UM DETERMINADO 
  ALUNO.

  PARA TANTO ANTES INICIAR QUALQUER O ALUNO
  DEVERÁ ESTAR LOGADO PARA QUE POSSA ACESSAR
  AS FUNCIONALIDADES CONTIDAS NESTE MVC.
'''

class AtividadesController < ApplicationController
  before_filter :authenticate_aluno!
  before_filter :current_aluno

  # GET /atividades
  # GET /atividades.json
  def index
    @atividades = Atividade.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @atividades }
    end
  end

  # GET /atividades/1
  # GET /atividades/1.json
  def show
    @atividade = Atividade.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @atividade }
    end
  end

  # GET /atividades/new
  # GET /atividades/new.json
  def new
    @atividade = Atividade.new
    @current_aluno = current_aluno

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @atividade }
    end
  end

  # GET /atividades/1/edit
  def edit
    @atividade = Atividade.find(params[:id])
    @current_aluno = current_aluno
  end

  # POST /atividades
  # POST /atividades.json
  def create
    @atividade = Atividade.new(params[:atividade])
    @current_aluno = current_aluno
    respond_to do |format|
      if @atividade.save
        SendConfirmAtividade.send_atividade_email(@current_aluno, @atividade).deliver
        format.html { redirect_to listadeatividades_path, notice: I18n.t('atividades.new.successfully_registrated', :user_name=> @current_aluno.nome) }
        format.json { render json: @atividade, status: :created, location: @atividade }
      else
        format.html { render action: "new" }
        format.json { render json: @atividade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /atividades/1
  # PUT /atividades/1.json
  def update
    @atividade = Atividade.find(params[:id])
    @current_aluno = current_aluno
    respond_to do |format|
      if @atividade.update_attributes(params[:atividade])
        format.html { redirect_to listadeatividades_path, notice: I18n.t('atividades.update.successfully_updated', :user_name=> @current_aluno.nome) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @atividade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atividades/1
  # DELETE /atividades/1.json
  def destroy
    @atividade = Atividade.find(params[:id]).destroy
    @current_aluno = current_aluno

    respond_to do |format|
      format.html { redirect_to listadeatividades_path, notice: I18n.t('atividades.destroy.deleted', :user_name=> @current_aluno.nome) }
      format.json { head :no_content }
    end
  end

  '''
    O METODO ABAIXO É RESPONSAVEL POR
    ANEXAR UM COMPROVANTE A UMA ATIVIDADE
    AO TERMINAR ELE REDIRECIONA O USUARIO
    PARA A LISTA DAS ATIVIDADES DO MESMO.
  '''

  # GET /atividades/1/comprovante_file
  def comprovante_file
    unless aluno_signed_in? and current_aluno
      redirect_to root_path :alert => I18n.t('messages.accessrestricted')
    else
      @atividade = Atividade.find(params[:id])
      @current_aluno = current_aluno
    end
  end

  def anexar_comprovante
    @atividade = Atividade.find(params[:id])
    @current_aluno = current_aluno
    respond_to do |format|
      if @atividade.update_attributes(comprovante_params)
        format.html { redirect_to listadeatividades_path, notice: I18n.t('atividades.update.successfully_updated', :user_name=> @current_aluno.nome) }
        format.json { head :no_content }
      else
        format.html { render action: "comprovante_file" }
        format.json { render json: @atividade.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def comprovante_params
      # NOTE: Using 'strong_parameters' gem
      params.require(:atividade).permit(:comprovante)
    end
end