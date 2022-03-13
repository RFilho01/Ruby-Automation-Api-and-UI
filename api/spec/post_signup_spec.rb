require_relative "routes/signup"
require_relative "libs/mongo"

describe "POST /signup" do
    context "Criar usuario com sucesso" do
        before(:all) do
            payload = { name: "Victoria", email: "victoria@gmail.com", password:"1213"}
            MongoDB.new.remove_user(payload[:email])

            @result = Signup.new.create(payload)
        end

        it "Validar Status Code" do
            expect(@result.code).to eql 200
        end

        it "Validar Tamanho ID do Usuário" do
            expect(@result.parsed_response["_id"].length).to eql 24
        end
    end
end