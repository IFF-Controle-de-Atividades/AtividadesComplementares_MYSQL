#--*-- coding:utf-8 --*--
class AvaliacoesController < ApplicationController
  before_filter :authenticate_avaliador!
  before_filter :current_avaliador

  respond_to :html, :xml
  def listar_atividades
    unless current_avaliador.admin
      redirect_to avaliadores_index_path, :notice=> I18n.t('messages.accessrestricted')
    else
      @atividades = Atividade.paginate(:page => params[:page], :per_page=>15)
      if @atividades.empty?
        redirect_to avaliadores_index_path, :alert=> I18n.t('messages.accesserror')
      end
    
      @avaliadores= Avaliador.all
    end
  end

  def designar
    Atividade.where(:id => params[:atividades_ids]).update_all(:designada_em => Time.now, :avaliador_id => params[:avaliador_id])
    @avaliador = Avaliador.find(params[:avaliador_id])
    @atividade = Atividade.where(:id => :atividades_ids)
    redirect_to atividades_complementares_path, :notice => t('reviews.activities_appointed', :appraiser=> @avaliador.nome)
  end

  def list
    @aluno = Aluno.find(params[:id])
    if @aluno.atividades.empty?
      redirect_to avaliadores_index_path, :notice => t('avaliacoes.list.activitieerror', :user_name => @aluno.nome)
    else
      @avaliadores= Avaliador.where(:admin => 0)
      @atividades = Atividade.where(:aluno_id => @aluno ).paginate(:page => params[:page], :per_page=>4)  
    end
  end

  ######### appraiser_activities Destinado apenas a quem vai avaliar ############

  def appraiser_activities
    unless current_avaliador && avaliador_signed_in?
      redirect_to avaliadores_index_path, :notice => t('messages.accessrestricted')
    else
      @avaliador = current_avaliador
      @atividades = Atividade.where(:avaliador_id => @avaliador.id).paginate(:page => params[:page], :per_page=>10)
      #if @atividades != @avaliador.id
      #  redirect_to avaliadores_index_path, :notice => t('messages.accesserror')
      #end  
    end
  end

  '''
    O METODO LIVE SEARCH ABAIXO É RESPONSÁVEL POR EFETUAR UM BUSCA AO VIVO
    DAS ATIVIDADES ENCONTRADOS NO SISTEMA DESIGNADAS PARA O AVALIADOR AO 
    QUAL PERTENCE!

    NÃO É FEITO NADA MAIS DO QUE UMA QUERY PASSANDO COMO PARAMENTROS 
    O PRÓPRIO LIVE_SEARCH DO TIPO ATIVIDADE:TITLE.
  '''

  def atividade_live_search
      @avaliador = current_avaliador
      @tasks = Atividade.where(:avaliador_id => @avaliador.id).paginate(:page => params[:page], :per_page=>10).find(:all, :conditions => ["title LIKE ?","%#{params[:live_search]}%"])
      if @tasks.empty?
        redirect_to avaliadores_index_path, :alert => I18n.t('messages.no_match', :live_search=> params[:live_search])
      end
  end

  ################################################################################

  def avaliar_atividade
    @atividade = Atividade.find(params[:id])
  end

  def avaliar
    @atividade = Atividade.find(params[:id])
    if @atividade.update_attributes(params[:atividade])
      redirect_to avaliadores_index_path, :notice => I18n.t('reviews.activitie_evaluated')
    else
      render :avaliar_atividade
    end
  end

  def list_avaliacoes
    unless current_avaliador.admin
      redirect_to avaliador_index_path, :notice=> I18n.t('messages.accessrestricted')
    else
      @avaliadores = Avaliador.where(:admin => 0).paginate(:page => params[:page],
:per_page=>4)
    end
    
  end

  def exibir_avaliacoes
    unless current_avaliador.admin
      redirect_to avaliador_index_path, :notice=> I18n.t('messages.accessrestricted')
    else
      @avaliadores = Avaliador.paginate(:page => params[:page], :per_page=>4)
      @avaliador = Avaliador.find(params[:id])
      @atividades = Atividade.where(:avaliador_id => @avaliador.id).paginate(:page => params[:page], :per_page=>4)
      if @atividades.empty?
        redirect_to total_avaliadores_path :alert => I18n.t('reviews.not_hanking', :appraiser=>@avaliador.nome)
        flash[:alert] = I18n.t('reviews.not_hanking', :appraiser=>@avaliador.nome)
      end
    end
  end
end
