
Dado('que acesso a página de cadastro') do
  visit "rocklov-web:3000/signup"
end

Quando('submeto o meu cadastro completo') do

end

Quando('submeto o seguinte formulário de cadastro:') do |table|
  user = table.hashes.first

  MongoDB.new.remove_user(user[:email])

  find("#fullName").set user[:nome]
  find("#email").set user[:email]
  find("#password").set user[:senha]

  click_button("Cadastrar")
end

Então('sou redirecionado para o Dashboard') do
  expect(page).to have_css ".dashboard"
end


Então('vejo a mensagem de alerta: {string}') do |expected_alert|
  alert = find(".alert-dark")
  expect(alert.text).to eql expected_alert
end