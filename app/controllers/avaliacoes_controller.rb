#--*-- coding:utf-8 --*--
class AvaliacoesController < ApplicationController
  before_filter :authenticate_avaliador!
  before_filter :current_avaliador

  respond_to :html, :xml
  def listar_atividades
    unless current_avaliador.admin
      redirect_to avaliador_index_path, :notice=> I18n.t('messages.accessrestricted')
    else
      @atividades = Atividade.paginate(:page => params[:page], :per_page=>4)
      @avaliadores= Avaliador.all
    end
  end

  def designar
    @avaliador = params[:avaliador_id]
    Atividade.where(:id => params[:atividades_ids]).update_all(:designada_em => Time.now, :avaliador_id => params[:avaliador_id])
    @atividade = Atividade.where(:id => :atividades_ids)
    redirect_to :listar_atividades, :notice => t('reviews.activities_appointed', :appraiser=> @avaliador.nome)
  end

  def list
    @aluno = Aluno.find(params[:id])
    @avaliadores= Avaliador.all
    @atividade = Atividade.where(:aluno_id => @aluno ).paginate(:page => params[:page], :per_page=>4)
  end

  def x_list
    @aluno = Aluno.find(params[:id])
    @atividade = Atividade.where(:aluno_id => @aluno ).paginate(:page => params[:page], :per_page=>4)    
  end

  def avaliar_atividade
    @atividade = Atividade.find(params[:id])
  end

  def avaliar
    @atividade = Atividade.find(params[:id])
    if @atividade.update_attributes(params[:atividade])
      redirect_to :x_list, :notice => I18n.t('reviews.activitie_evaluated')
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
      @avaliadores = Avaliador.where(:admin => 0).paginate(:page => params[:page], :per_page=>4)
      @avaliador = Avaliador.find(params[:id])
      @atividades = Atividade.where(:avaliador_id => @avaliador.id).paginate(:page => params[:page], :per_page=>4)
      if @atividades.empty?
        redirect_to total_avaliadores_path :alert => I18n.t('reviews.not_hanking', :appraiser=>@avaliador.nome)
      end
    end
  end
end
