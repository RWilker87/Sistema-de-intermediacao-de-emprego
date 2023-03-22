
Given('que existe um empregador chamado {string} dono da empresa {string} com o email {string} com o endereco {string} com o telefone {string} e com o cnpj {string}') do |nome, empresa, email, endereco, telefone, cnpj|
  @empregador = Empregador.create!(nome: nome, nomeEmpresa: empresa, email: email, endereco: endereco, telefone: telefone, cnpj: cnpj)
end

And('tem disponivel a seguinte vaga de emprego: Titulo: {string}, Descricao: {string} e Salario: {string}') do |titulo, descricao, salario|
  @vaga_de_emprego = VagaDeEmprego.create!(titulo: titulo, descricao: descricao, salario: salario, empregador: @empregador)
end

And('eu acesso a pagina de criar um entrevistador') do
  visit '/entrevistadors/new'
end

And('preencho os campos para criacao de entrevistador') do
  Entrevistador.create!(nome: "Victor", email: 'victor@gmail.com', telefone: '11-12345-1234')
  vaga = VagaDeEmprego.find_by(titulo: "Dev Pleno ruby on rails")
  select vaga.titulo, from: "entrevistador[vaga_de_emprego_id]"
end

And('clico no botao para salvar o entrevistador') do
  click_button 'Create Entrevistador'
end

Then('eu vejo uma mensagem que informa que o entrevistador foi criado com sucesso') do
  page.has_content?('Entrevistador cadastrado com sucesso')
end



Given('que existe um empregador chamado {string} dono da empresa {string} com o email {string} com o endereco {string} com o telefone {string} e com o cnpj {string}') do |nome, empresa, email, endereco, telefone, cnpj|
  Empregador.create!(nome: nome, empresa: empresa, email: email, endereco: endereco, telefone: telefone, cnpj: cnpj)
end

Given('tem disponivel a seguinte vaga de emprego: Titulo: {string}, Descricao: {string} e Salario: {string}') do |titulo, descricao, salario|
  VagaDeEmprego.create!(titulo: titulo, descricao: descricao, salario: salario)
end

When('eu acesso a pagina de criar um entrevistador') do
  visit '/entrevistadors/new'
end

When('preencho alguns campos obrigatórios para criacao de entrevistador') do
  fill_in 'Nome', with: 'Victor'
end

When('clico no botao para salvar o entrevistador') do
  click_button 'Salvar'
end

Then('eu vejo uma mensagem de erro informando que o campo obrigatorio faltante deve ser preenchido') do
  expect(page).to have_content('não pode ficar em branco')
end

