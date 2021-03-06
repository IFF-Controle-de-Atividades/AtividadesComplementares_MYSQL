#--*-- coding:utf-8 --*--
class AlunosController < ApplicationController
  before_filter :authenticate_aluno!
  before_filter :current_aluno
  
  def index
    #TODO generated code can be changed here
  end

  def profileimage
    @aluno = current_aluno
  end

  def reloadimageprofile
    @aluno = current_aluno
    if @aluno.update_attributes(user_image)
      redirect_to aluno_index_path, :notice => t('alunos.changeimage.image_updated')
    else
      render :profileimage
    end
  end

  def removeimage
    @aluno = current_aluno
    @aluno.remove_image!
    @aluno.remove_image = true
    if @aluno.save
        redirect_to aluno_index_path, :notice => t('alunos.changeimage.image_updated')
    end
  end

  def alter_password_information
    @aluno = current_aluno
  end

  def changepassword
    @aluno = Aluno.find(current_aluno.id)
    if @aluno.update_attributes(user_params)
        sign_in @aluno, :bypass => true
        redirect_to aluno_index_path, :notice => t('alunos.password.password_updated')
    end 
  end

  private
    def user_params
      # NOTE: Using 'strong_parameters' gem
      params.require(:aluno).permit(:password, :password_confirmation)
    end

    def user_image
      # NOTE: Using 'strong_parameters' gem
      params.require(:aluno).permit(:image)
    end
end