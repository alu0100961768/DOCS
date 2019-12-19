# @autor Germán Alfonso Teixidó
class Menu
    # Los atributos son de lectura y escritura.
    attr_accessor :platosmenu

    #
    # Constructor.
    #
    # @param [List] platosmenu Lista de platos del menú.
    #
    def initialize(platosmenu)
      @platosmenu= platosmenu
    end

    #
    # Impacto ambiental del menú.
    #
    # @return [Double] Impacto ambiental del menú.
    def impacto
      aux= 0.0.to_d
      @platosmenu.each do |plato|
        aux+= (plato[0].GEI* plato[1])  
      end
      return aux
    end
end