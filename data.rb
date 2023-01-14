require 'csv'
require './app/jobs/my_job'

class Data
  attr_accessor :conn

  def initialize
    @conn = PG.connect(host: 'postgres', dbname: 'postgres', user: 'postgres')
  end

  def csv_data
    rows = CSV.read("./data.csv", col_sep: ';')

    columns = rows.shift
  
    rows.map do |row|
      row.each_with_object({}).with_index do |(cell, acc), idx|
        column = columns[idx]
        acc[column] = cell
      end
    end
  end

  def insert_data(json_data)
    csv_data.each do |row|
      @conn.exec(
        "INSERT INTO EXAMS (cpf, nome_paciente, email_paciente, data_nascimento_paciente, 
                            endereço_rua_paciente, cidade_paciente, estado_patiente, crm_médico,
                            crm_médico_estado, nome_médico, email_médico, token_resultado_exame,
                            data_exame, tipo_exame, limites_tipo_exame, resultado_tipo_exame)
          VALUES ('#{row['cpf']}', '#{row['nome paciente']}', '#{row['email paciente']}', '#{row['data nascimento paciente']}', '#{row['endereço/rua paciente']}',
                  '#{@conn.escape_string(row['cidade paciente'])}', '#{row['estado patiente']}',
                  '#{row['crm médico']}', '#{row['crm médico estado']}',
                  '#{row['nome médico']}', '#{row['email médico']}',
                  '#{row['token resultado exame']}', '#{row['data exame']}',
                  '#{row['tipo exame']}', '#{row['limites tipo exame']}', #{row['resultado tipo exame']})"
      )
    end
  end

  def all
    @conn.exec('SELECT * FROM EXAMS LIMIT 100').to_a
  end
end