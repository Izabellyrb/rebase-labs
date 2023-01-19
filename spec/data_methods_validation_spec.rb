require 'spec_helper'
require './data.rb'

describe 'Data.rb methods' do
  it 'create_table - cria tabela EXAMS no banco de dados' do
    conn = PG.connect(host: 'postgres', dbname: 'postgres', user: 'postgres')
    Data.new.create_table

    table = conn.exec('SELECT * FROM EXAMS').to_a

    expect(table.length).to eq 0
  end

  it 'insert_data - popula a tabela EXAMS com os dados dos pacientes' do
    conn = PG.connect(host: 'postgres', dbname: 'postgres', user: 'postgres')
    Data.new.insert_data('./spec/data_spec.csv')

    table = conn.exec('SELECT * FROM EXAMS').to_a

    expect(table[0]['nome_paciente']).to eq 'Emilly Batista Neto'
    expect(table[2]['nome_paciente']).to eq 'Juliana dos Reis Filho'
    expect(table[4]['nome_paciente']).to eq 'Matheus Barroso'
    expect(table[6]['nome_paciente']).to eq 'Patricia Gentil'
    expect(table[0]['token_resultado_exame']).to eq 'IQCZ17'
    expect(table[2]['token_resultado_exame']).to eq '0W9I67'
    expect(table[4]['token_resultado_exame']).to eq 'T9O6AI'
    expect(table[6]['token_resultado_exame']).to eq 'TJUXC2'
  end

  it 'all - exibe todos os dados do arquivo' do
    conn = PG.connect(host: 'postgres', dbname: 'postgres', user: 'postgres')
    Data.new.insert_data('./spec/data_spec.csv')

    table = conn.exec('SELECT * FROM EXAMS').to_a
    length = table.length

    expect(length).to eq 8
  end

end


