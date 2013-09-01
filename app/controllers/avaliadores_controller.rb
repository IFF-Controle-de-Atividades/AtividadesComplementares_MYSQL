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
    unless current_avaliador.admin.nil?
      flash[:notice] => t("avaliadores.new.admin_error")
    end
  end

  def create
    @avaliador = Avaliador.new(params[:avaliador])
    if @avaliador.save
      redirect_to avaliador_index_path
      flash[:notice] => t("avaliadores.create.notice")
    else
      render :action => :new
    end
  end

  def edit
  end

  def update
  end
end
