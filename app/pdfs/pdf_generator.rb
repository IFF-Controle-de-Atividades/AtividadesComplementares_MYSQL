#encoding:utf-8
class PDF_GENERATOR < Prawn::Document
      
    def page_layout
        options= {:page_size=> "A4",:page_layout=>:landscape,:margin=> [10, 17]}
    end

    def logo
      logopath =  "#{Rails.root}/app/assets/images/IFFbanner.png"
      image logopath, :width => 780, :height => 120
    end

    def linha_de_assinatura
        stroke do
            horizontal_line 200, 520, :at => 15
        end
        draw_text "Assinatura do Coordenador", :at => [270,0.5]
    end

    def nome_documento
        #TODO Generated Code can be changed
    end

    def exibir_documento(collection)
        itens = Array.new(collection) {collection}
        move_down 10
        table itens do
            row(0).font_style = :bold
            row(0).align = :center
            row(0).style :background_color => 'EEE9E9'
            
            columns(1..7).align = :center
            self.row_colors = ["FFFFFF", "C1FFC1"]
            self.width  = 805
            self.header = true
        end
        linha_de_assinatura
    end

    def yes_or_no?(value)
        value ? "Sim" : "Não"
    end

    def itens_tabela
        #TODO Generated Code can be changed
    end
end