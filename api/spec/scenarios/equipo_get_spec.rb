
describe "GET /equipos/{equipo_id}" do

    before(:all) do
        payload = { email: "to@mate.com", password: "pwd123"}
        result = Sessions.new.login(payload)
        @user_id = result.parsed_response["_id"]
    end

    context "Obter unico equipo" do
        before(:all) do
            # Dado que tenho um novo equipamento
            @payload = {
                thumbnail: Helpers::get_thumb("violao.jpg"),
                name: "Violao Classico 7 Cordas",
                category: "Cordas",
                price: 350,
            }

            MongoDB.new.remove_equipo(@payload[:name], @user_id)

            # E tenho o id desse equipamento
            equipo = Equipos.new.create(@payload, @user_id)
            @equipo_id = equipo.parsed_response["_id"]

            # Quando faço uma requisição GET pelo id
            @result = Equipos.new.find_by_id(@equipo_id, @user_id)
        end

        it "Deve retornar 200" do
            expect(@result.code).to eql 200
        end

        it "Deve retornar o nome do equipo igual ao enviado no payload" do
            expect(@result.parsed_response).to include("name" => @payload[:name])
        end
    end

    context "Equipo inexistente" do
        before(:all) do
            @result = Equipos.new.find_by_id(MongoDB.new.get_mongo_id, @user_id)
        end

        it "Deve retornar 404" do
            expect(@result.code).to eql 404
        end
    end
end