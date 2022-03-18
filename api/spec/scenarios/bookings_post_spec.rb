describe "POST /equipos/{equipo_id}/bookings" do
    
    before(:all) do
        payload = { email: "geraldo@azevedo.com", password: "pwd123"}
        result = Sessions.new.login(payload)
        @geraldo_id = result.parsed_response["_id"]
    end

    context "Solicitar locacao" do

        before(:all) do
            # Dado que "Zé Ramalho" tem um "Violão Clássico" para locação
            result = Sessions.new.login({ email: "ze@ramalho.com", password: "pwd123" })
            ze_id = result.parsed_response["_id"]

            violao = {
                thumbnail: Helpers::get_thumb("violao-ze.jpg"),
                name: "Violao do Ze Ramalho",
                category: "Cordas",
                price: 500,
            }
            
            MongoDB.new.remove_equipo(violao[:name], ze_id)

            result = Equipos.new.create(violao, ze_id)
            ze_violao_id = result.parsed_response["_id"]

            # Quando solicito a locação do violão do Zé Ramalho
            @result = Equipos.new.bookings(ze_violao_id, @geraldo_id)
        end

        it "Deve retornar 200" do
            expect(@result.code).to eql 200
        end
    end
end