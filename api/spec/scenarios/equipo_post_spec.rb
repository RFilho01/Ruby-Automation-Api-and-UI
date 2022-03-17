
describe "POST /equipo" do
    
    before(:all) do
        payload = { email: "to@mate.com", password: "pwd123"}
        result = Sessions.new.login(payload)
        @user_id = result.parsed_response["_id"]
    end

    context "Cadastro novo equipo" do
        thumbnail = Helpers::get_thumb("acordeon.jpg")
        
        before(:all) do
            payload = {
                thumbnail: thumbnail,
                name: "Acordeon Leticce",
                category: "Teclas",
                price: 2000,
            }

            MongoDB.new.remove_equipo(payload[:name], @user_id)

            @result = Equipos.new.create(payload, @user_id)
        end
        
        it "Deve retornar 200" do
            expect(@result.code).to eql 200
        end
    end

    context "Nao Autorizado" do
        thumbnail = Helpers::get_thumb("violao.jpg")
        
        before(:all) do
            payload = {
                thumbnail: thumbnail,
                name: "Acordeon Leticce",
                category: "Teclas",
                price: 2000,
            }
            @result = Equipos.new.create(payload, nil)
        end
        
        it "Deve retornar 401" do
            expect(@result.code).to eql 401
        end
    end
end