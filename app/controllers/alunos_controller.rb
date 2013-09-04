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

  def changeimage
    @aluno = current_aluno
    if @aluno.update_attributes(params[:aluno])
        redirect_to aluno_index_path, :notice => t('alunos.changeimage.image_updated')
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

  def password
    @aluno = current_aluno
  end

  def changepassword
    @aluno = current_aluno
    if @aluno.update_attributes(params[:password])
        redirect_to aluno_index_path, :notice => t('alunos.changepassword.password_updated')
    end 
  end
end