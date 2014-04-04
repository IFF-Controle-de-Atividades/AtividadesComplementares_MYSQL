#--*-- coding:UTF-8 --*--
class ModalidadesController < ApplicationController
  before_filter :authenticate_avaliador!
  before_filter :current_avaliador

  def index
    unless current_avaliador.admin and avaliador_signed_in?
      redirect_to avalidores_index_url, :alert => t('messages.accessrestricted')
    else
      @modalidades = Modalidade.all  
    end  
  end

  # def show
  #     @modalidade = Modalidade.find(params[:id])
  # end

  def new
    unless current_avaliador.admin and avaliador_signed_in?
      redirect_to avalidores_index_url, :alert => t('messages.accessrestricted')
    else
      @modalidade = Modalidade.new
    end
  end

  def edit
    unless current_avaliador.admin and avaliador_signed_in?
      redirect_to avalidores_index_url, :alert => t('messages.accessrestricted')
    else
      @modalidade = Modalidade.find(params[:id])  
    end
  end

  def create
    @modalidade = Modalidade.new(params[:modalidade])
    if @modalidade.save
      redirect_to modalidades_index_path, :notice => t('modalidades.create.successfully_created')
    else
      render :new
    end  
  end

  def update
    @modalidade = Modalidade.find(params[:id])
    if @modalidade.update_attributes(params[:modalidade])
      redirect_to modalidades_index_path, :notice => t('modalidades.update.successfully_updated')
    else
      render :edit
    end
  end

  def destroy
    unless current_avaliador.admin and avaliador_signed_in?
      redirect_to avalidores_index_url, :alert => t('messages.accessrestricted')
    else
      @modalidade = Modalidade.find(params[:id]).destroy
      redirect_to modalidades_index_path, :notice => t('modalidades.destroy.successfully_destroyed')
    end
  end
end