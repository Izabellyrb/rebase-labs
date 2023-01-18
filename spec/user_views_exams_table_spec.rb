require 'spec_helper'
require './data'

describe 'Usuário vê os exames na página inicial' do
  it 'com sucesso' do
    visit '/'

    expect(page).to have_content 'Consulta de Exames'
    expect(page).to have_content 'Token'
    expect(page).to have_content 'Nome'
    expect(page).to have_content 'CRM Médico'
    expect(page).to have_content 'Cpf'    
    expect(page).to have_content 'Endereço'
    expect(page).to have_content 'Cidade'
    expect(page).to have_content 'Estado'
    expect(page).to have_content 'Tipo'
    expect(page).to have_content 'Limites'
    expect(page).to have_content 'Resultado'
  end
end