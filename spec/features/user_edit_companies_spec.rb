require 'rails_helper'

feature 'User edit company' do
  scenario 'successfully' do
    company = Company.create(name: 'Campus Code',
                           location: 'São Paulo',
                           mail: 'contato@campus.com.br',
                           phone: '2369-3476')
    
    visit edit_company_path(company)

    fill_in 'Nome',        with: 'CampusCode RJ'
    fill_in 'Local',       with: 'Rio de Janeiro'
    fill_in 'Email',       with: 'contato@campuscode.com.br'
    fill_in 'Telefone',    with: '2020-1234'

    click_on 'Atualizar Empresa'
    
    expect(page).to have_css('h1', text: 'CampusCode RJ')  
    expect(page).to have_content 'Rio de Janeiro'
    expect(page).to have_content 'contato@campuscode.com.br'
    expect(page).to have_content '2020-1234'
  end
  
  scenario 'with invalid data' do
    company = Company.create(name: 'Campus Code',
                           location: 'São Paulo',
                           mail: 'contato@campus.com.br',
                           phone: '2369-3476')
    
    visit edit_company_path(company)

    fill_in 'Nome', with: ''

    click_on 'Atualizar Empresa'

    expect(page).to have_content 'Não foi possível atualizar a empresa'
  end

end