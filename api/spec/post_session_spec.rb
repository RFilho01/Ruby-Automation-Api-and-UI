require_relative "routes/sessions"

describe "POST /sessions" do
    context "Login com Sucesso" do
        before(:all) do
            payload = { email: "roberto@gmail.com", password: "pwd123"}
            @result = Sessions.new.login(payload)
        end

        it "Validar Status Code" do 
            expect(@result.code).to eql 200
        end

        it "Validar Tamanho ID do Usuário" do
            expect(@result.parsed_response["_id"].length).to eql 24
        end
    end

    examples = [
        {
            title: "Senha Inválida",
            payload: { email: "roberto@gmail.com", password: "1234"},
            code: 401,
            message: "Unauthorized",
        },
        {
            title: "Email Inválido",
            payload: { email: "404@gmail.com", password: "pwd123"},
            code: 401,
            message: "Unauthorized",
        },
        {
            title: "Email em branco",
            payload: {email: "", password: "pwd123"},
            code: 412,
            message: "required email",
        },
        {
            title: "Sem enviar campo Email",
            payload: {password: "pwd123"},
            code: 412,
            message: "required email",
        },    
        {
            title: "Senha em Branco",
            payload: { email: "roberto@gmail.com", password: ""},
            code: 412,
            message: "required password",
        },
        {
            title: "Sem enviar campo Senha",
            payload: { email: "roberto@gmail.com"},
            code: 412,
            message: "required password",
        },
    ]

    examples.each do |e|
        context "#{e[:title]}" do
            before(:all) do
                payload = e[:payload]
                @result = Sessions.new.login(payload)
            end
    
            it "Validar Status Code #{e[:code]}" do 
                expect(@result.code).to eql e[:code]
            end
    
            it "Validar Tamanho ID do Usuário" do
                expect(@result.parsed_response["error"]).to eql e[:message]
            end
        end
    end
end