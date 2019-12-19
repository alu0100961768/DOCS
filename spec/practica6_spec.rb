RSpec.describe Practica6 do

  context "Practica 9" do
    before(:each) do
      @listaPlatoPrimero= List.new
      @listaPlatoPrimero.push_tail(Comida.new("Carne de vaca", 21.1, 0.0, 3.1, 50.0, 164.0))
      @listaPlatoPrimero.push_tail(Comida.new("Carne de cordero", 18.0, 0.0, 17.0, 20.0, 185.0))
      @listaPlatoPrimero.push_tail(Comida.new("Camarones (piscifactoría)", 17.6, 1.5, 0.6, 18.0, 2.0))
      @listaCantidadUno= List.new
      @listaCantidadUno.push_tail(2000.0)
      @listaCantidadUno.push_tail(1500.0)
      @listaCantidadUno.push_tail(8000.0)
      @plato1= MejorPlato.new("Plato1", @listaPlatoPrimero, @listaCantidadUno)

      @listaPlatoSegundo= List.new
      @listaPlatoSegundo.push_tail(Comida.new("Chocolate", 5.3, 47.0, 30.0, 50.3, 3.4))
      @listaPlatoSegundo.push_tail(Comida.new("Salmon (piscifactoría)", 19.9, 0.0, 13.6, 6.0, 3.7))
      @listaPlatoSegundo.push_tail(Comida.new("Cerdo", 21.5, 0.0, 6.3, 20, 11.0))
      @listaCantidadDos= List.new
      @listaCantidadDos.push_tail(300.0)
      @listaCantidadDos.push_tail(1200.0)
      @listaCantidadDos.push_tail(3000.0)
      @plato2= MejorPlato.new("Plato2", @listaPlatoSegundo, @listaCantidadDos)

      @listaPlatoTercero= List.new
      @listaPlatoTercero.push_tail(Comida.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2))
      @listaPlatoTercero.push_tail(Comida.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4))
      @listaPlatoTercero.push_tail(Comida.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9))
      @listaCantidadTres= List.new
      @listaCantidadTres.push_tail(100.0)
      @listaCantidadTres.push_tail(200.0)
      @listaCantidadTres.push_tail(500.0)
      @plato3= MejorPlato.new("Plato3", @listaPlatoTercero, @listaCantidadTres)
    end

    context "Funcion huella nutricional" do
      it "Las energías se calculan correctamente" do
        expect(@plato1.valorCaloricoTotal).to eq 1216.5
        expect(@plato2.valorCaloricoTotal).to eq 814.26
        expect(@plato3.valorCaloricoTotal).to eq 396.2
      end

      it "Las Emisiones de carbono se calculan correctamente" do
        expect(@plato1.emisionInvernadero).to eq 2740
        expect(@plato2.emisionInvernadero).to eq 822.9
        expect(@plato3.emisionInvernadero).to eq 4.3
      end

      it "Las Huellas nutricionales se calculan correctamente" do
        expect(@plato1.huellaNutricional).to eq 3
        expect(@plato2.huellaNutricional).to eq 2
        expect(@plato3.huellaNutricional).to eq 1
      end
    end

    context "Incrementar precio de un menú en base al plato mas caro de un menú" do
      it "Con coste 1" do
        menu= [@plato3, @plato3, @plato3]
        costes= [1, 2, 3]
        expect(@plato3.aumentarPrecios(costes, menu)).to eq [2, 4, 6]
      end
      it "Con coste 2" do
        menu= [@plato2, @plato3, @plato3]
        costes= [1, 2, 3]
        expect(@plato3.aumentarPrecios(costes, menu)).to eq [3, 6, 9]
      end
      it "Con coste 3" do
        menu= [@plato2, @plato3, @plato1]
        costes= [1, 2, 3]
        expect(@plato3.aumentarPrecios(costes, menu)).to eq [4, 8, 12]
      end
    end
    
  end
end
