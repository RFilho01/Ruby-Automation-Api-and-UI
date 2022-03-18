
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

    context "Usuario ja existe" do
        before(:all) do
            # Dado que tenho um novo usuário
            payload = { name: "Joao", email: "joao@ig.com", password:"pwd123"}
            
            # E o email desse usuario já foi cadastrado no sistema
            Signup.new.create(payload)

            # Quando faço uma requisição para a rota /signup
            @result = Signup.new.create(payload)
        end

        it "Deve retornar 409" do
            # Entao deve retornar 409
            expect(@result.code).to eql 409
        end

        it "Deve retornar mensagem de erro informando que o email já está cadastrado" do
            expect(@result.parsed_response["error"]).to eql "Email already exists :("
        end
    end

    context "Obrigatoriedade do campo Nome" do
        before(:all) do 
            payload = {email: "joao@ig.com", password: "pwd123"}
            @result = Signup.new.create(payload)
        end

        it "Deve retornar 412" do
            expect(@result.code).to eql 412
        end

        it "Deve retornar mensagem de erro informando que o campo nome é obrigatório" do
            expect(@result.parsed_response["error"]).to eql "required name"
        end
    end

    context "Obrigatoriedade do campo email" do
        before(:all) do
            payload = { nome: "Joao", password: "pwd123" }
            @result = Signup.new.create(payload)
        end

        it "Deve retornar 412" do
            expect(@result.code).to eql 412
        end

        it "Deve retornar mensagem de erro informando que o campo email é obrigatório" do
            expect(@result.parsed_response["error"]).to eql "required name"
        end
    end

    context "Obrigatoriedade do campo Senha" do
        before(:all) do
            payload = { name: "Jose", email: "jose@ig.com" }
            @result = Signup.new.create(payload)
        end

        it "Deve retornar 412" do
            expect(@result.code).to eql 412
        end

        it "Deve retornar mensagem de erro informando que o campo senha é obrigatório" do
            expect(@result.parsed_response["error"]).to eql "required password"
        end
    end
end