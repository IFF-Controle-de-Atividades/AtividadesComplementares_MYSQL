#--*-- coding:utf-8 --*--
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
        format.html { redirect_to aluno_index_path, notice: I18n.t('atividades.new.successfully_registrated', :user_name=> @current_aluno.nome) }
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
        format.html { redirect_to aluno_index_path, notice: I18n.t('atividades.update.successfully_updated', :user_name=> @current_aluno.nome) }
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
end
