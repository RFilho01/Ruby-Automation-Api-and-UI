Dado('que acesso a página de cadastro') do
  visit "rocklov-web:3000/signup"
end

Quando('submeto o meu cadastro completo') do
  find("#fullName").set "Roberto Filho"
  find("#email").set "roberto@12.com"
  find("#password").set "pwd123"
  click_button("Cadastrar")
end

Então('sou redirecionado para o Dashboard') do
  expect(page).to have_css ".dashboard"
  sleep 10
end