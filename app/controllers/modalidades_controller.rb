#--*-- coding:UTF-8 --*--
class ModalidadesController < ApplicationController
  before_filter :autehticante_avaliador!
  before_filter :current_avaliador

  def index
    unless current_avaliador.admin and avaliador_signed_in?
      redirect_to avalidores_index_url, :alert => t('messages.accessrestricted')
    else
      @modalidades = Modalidades.all  
    end  
  end

  def show
    unless current_avaliador.admin and avaliador_signed_in?
      redirect_to avalidores_index_url, :alert => t('messages.accessrestricted')
    else
      @modalidade = Modalidades.find(params[:id])
    end
  end

  def new
    unless current_avaliador.admin and avaliador_signed_in?
      redirect_to avalidores_index_url, :alert => t('messages.accessrestricted')
    else
      @modalidade = Modalidades.new
    end
  end

  def edit
    unless current_avaliador.admin and avaliador_signed_in?
      redirect_to avalidores_index_url, :alert => t('messages.accessrestricted')
    else
      @modalidade = Modalidades.find(params[:id])  
    end
  end

  def create
    @modalidade = Modalidades.new(params[:modalidade])
    if @modalidade.save
      redirect_to modalidades_path, :notice => t('.successfully_created')
    else
      render :new
    end  
  end

  def update
    @modalidade = Modalidades.find(params[:modalidade])
    if @modalidade.update_attributes(params[:modalidade])
      redirect_to modalidades_path, :notice => t('.successfully_updated')
    else
      render :edit
    end
  end

  def destroy
    unless current_avaliador.admin and avaliador_signed_in?
      redirect_to avalidores_index_url, :alert => t('messages.accessrestricted')
    else
      @modalidade = Modalidades.find(params[:modalidade]).destroy
      redirect_to modalidades_path, :notice => t('.successfully_destroyed')
    end
  end
end