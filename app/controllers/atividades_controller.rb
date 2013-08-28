class AtividadesController < ApplicationController
  def index
    @atividades = Atividade.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @atividades }
    end
  end

  def show
    @atividade = Atividade.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @atividade }
    end
  end

  def new
    @atividade = Atividade.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @atividade }
    end
  end

  def create
    @atividade = Atividade.new(params[:atividade])
    respond_to do |format|
      if @atividade.save
        format.html { redirect_to aluno_home_path }
        flash[:notice] = "Sua Atividade foi inserida com sucesso"
        format.json { render json: @atividade, status: :created, location: @atividade }
      else
        format.html { render action: "new" }
        format.json { render json: @atividade.errors, status: :unprocessable_entity }
      end
  end

  def edit
    @atividade = Atividade.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @atividade }
    end
  end

  def update
    @atividade = Atividade.find(params[:id])

    respond_to do |format|
      if @atividade.update_attributes(params[:atividade])
        format.html { redirect_to aluno_home_path }
        flash[:notice] = "Sua Atividade foi atualizada com sucesso"
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @atividade.errors, status: :unprocessable_entity }
      end
  end

  def destroy
    @atividade = Atividade.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to listadeatividades_path }
      format.json { head :no_content }
  end
end
