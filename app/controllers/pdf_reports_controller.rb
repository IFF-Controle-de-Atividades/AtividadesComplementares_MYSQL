#encoding:utf-8
class PdfReportsController < ApplicationController
	def atividadealuno
	    @aluno = current_aluno
	    respond_to do |format|
	    	format.html
	    	format.pdf do
               pdf = AtividadesPdf.new(@aluno)
               send_data pdf.render, filename: "Minhas_Atividades.pdf",
               type: "application/pdf", disposition: "inline"
	    	end
	    end
    end

    def alunos_pdf
    	@aluno = Aluno.all.sort
	    respond_to do |format|
	    	format.html
	    	format.pdf do
               pdf = AlunosPdf.new(@aluno)
               send_data pdf.render, filename: "Total_Alunos.pdf",
               type: "application/pdf", disposition: "inline"
	    	end
	    end
   	end

   	def avaliadores_pdf
   		@avaliadores = Avaliador.all.sort
   		respond_to do |format|
	    	format.html
	    	format.pdf do
               pdf = AvaliadoresPdf.new(@avaliadores)
               send_data pdf.render, filename: "Total_Avaliadores.pdf",
               type: "application/pdf", disposition: "inline"
	    	end
	    end
   	end

    def total_atividades
      @atividades = Atividade.all.sort
      respond_to do |format|
        format.html
        format.pdf do
               pdf = TotalAtividadesPdf.new(@atividades)
               send_data pdf.render, filename: "Total_Atividades.pdf",
               type: "application/pdf", disposition: "inline"
        end
      end
    end
end
