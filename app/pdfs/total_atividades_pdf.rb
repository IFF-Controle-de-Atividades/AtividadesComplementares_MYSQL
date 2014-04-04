#encoding:utf-8
class TotalAtividadesPdf < PDF_GENERATOR
    def initialize(report)
        super(self.page_layout)
        @report = report
        _PDF_
    end

    def _PDF_
      self.logo
      move_down 20
      nome_documento
      move_down 30
      if @report.empty?
          draw_text "Não foram encontradas atividades", :at => [230,255], :size=> 20
          draw_text "_" * 46, :at => [220,255]
          draw_text "Por-favor aguarde as atividades", :at => [236,225], :size=> 20
          draw_text "_" * 46, :at => [220,225]
          draw_text "Att: A Coordenação", :at => [600,25], :size=> 20
          draw_text "_" * 26, :at => [600,18]
      else
          self.exibir_documento(itens_tabela)
          move_down 50
      end
    end

    def nome_documento
      time = Time.now
      data_do_dia = time.strftime("%d/%m/%Y - %H:%M:%S")
      text "Lista de Atividades", size: 25, style: :bold,horizontal_padding: 30
      text "\n#{data_do_dia}", size: 15, style: :bold
    end

    def itens_tabela 
      [ ["Atividade","Descrição", "Aluno","Avaliada","CH", "Avaliador"] ] +
          @report.collect do |item|
          [ 
            item.title, item.modalidade.title,
            item.aluno.nome, self.yes_or_no?(item.avaliada),
            if item.horas_aceitas.nil?
              text = I18n.t('messages.neither')
            else
              item.horas_aceitas
            end, 

            if item.avaliador.nil?
              text = I18n.t('messages.neither')
            else
              item.avaliador.nome
            end
          ]
      end
    end
end