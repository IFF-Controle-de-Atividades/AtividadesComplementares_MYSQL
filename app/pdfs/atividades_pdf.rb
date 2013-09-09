#encoding:utf-8
class AtividadesPdf < Prawn::Document
    PDF_OPTIONS =
    {
        :page_size   => "A4",
        :page_layout => :landscape,
        :margin      => [10, 17]
    }

    def initialize(report)
        super(PDF_OPTIONS)
        @report = report
        _PDF_
    end

    def logo
      logopath =  "#{Rails.root}/app/assets/images/IFFbanner.png"
      image logopath, :width => 780, :height => 120
    end

    def _PDF_
        logo
        move_down 20
        report_nome
        move_down 30
        if @report.atividades.empty?
            draw_text "Não foram encontradas atividades", :at => [230,255], :size=> 20
            draw_text "_" * 46, :at => [220,255]
            draw_text "Por-favor insira atividades", :at => [236,225], :size=> 20
            draw_text "_" * 46, :at => [220,225]
            draw_text "Att: A Coordenação", :at => [600,25], :size=> 20
            draw_text "_" * 26, :at => [600,18]
        else
            report_tabela
            move_down 50
        end
    end

    def linha_de_assinatura
        stroke do
            horizontal_line 200, 520, :at => 10
        end
        draw_text "Assinatura do Coordenador", :at => [280,0.5]
    end

    def report_nome
        time = Time.now
        data_do_dia = time.strftime("%d/%m/%Y - %H:%M:%S")
        text "Relatório de atividades", size: 25, style: :bold,horizontal_padding: 30
        text "\n#{data_do_dia}", size: 15, style: :bold
    end

    def report_tabela
        move_down 10
        table items_tabela do
            row(0).font_style = :bold
            columns(1..7).align = :center
            self.row_colors = ["DDDDDD", "FFFFFF"]
            self.width = 800
            self.header = true
        end
        linha_de_assinatura
    end

    def yes_or_no?(value)
        value ? "Sim" : "Não"
    end

    def items_tabela
        [ ["Nome", "Descricao", "Inicio" , "Termino" , "CH" , "CH - Aceita", "Aluno", "Avaliada",
"Avaliador"] ] +
            @report.atividades.collect do |item|
                [ item.title, item.modalidade.title,
                  item.inicio, item.termino,
                  item.horasganhas, if item.horas_aceitas.nil?
                                        I18n.t('messages.neither') 
                                    else
                                        item.horas_aceitas 
                                    end,
                  item.aluno.nome, yes_or_no?(item.avaliada), 
                  if  item.avaliador.nil?
                      item = I18n.t('messages.without_avaliador')
                  else
                    item.avaliador.nome
                  end
                ]
        end
    end
end