# Automação na Camada de UI
Para a automação dos testes de UI usei o Ruby, Capybara, Selenium, RSpec, Cucumber e Mongo pois implementei automação de acesso a database para executar queries com finalidade de deletar documentos entre os cenários. Decidi realizar esse tipo de automação com o intuito de não usar a gem Faker para evitar que, a cada cenário, seja criado um novo documento que acabaria 'inflando' a database e dificultando a rastreabilidade de uma possível não conformidade.

# Automação na Camada de API
Para automação dos testes de API usei o Ruby, RSpec, HTTParty para consumir a API e o mongo tendo em vista que também automatizei o acesso ao banco de dados.
