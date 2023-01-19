# Web app de listagem de exames médicos
App criado para listagem de exames médicos. <br>
Laboratório disponibilizado pela Rebase em parceria com a Campus Code.

 <br>

## ⚙ Configurações necessárias
- [Ruby](https://www.ruby-lang.org/en/documentation/installation/) 
- [Docker](https://www.ruby-lang.org/en/documentation/installation/) 
- [PostgreSQL](https://www.postgresql.org/) 
- [Redis](https://www.ruby-lang.org/en/documentation/installation/)  
- [Javascript](https://www.javascript.com/) 

<br>

## 💎 Gems instaladas
- [Sinatra](https://rubygems.org/gems/sinatra)
- [Rack](https://rubygems.org/gems/rack)
- [Puma](https://rubygems.org/gems/puma) 
- [Pg](https://rubygems.org/gems/pg) 
- [Sidekiq](https://rubygems.org/gems/sidekiq)
- [Rspec](https://rubygems.org/gems/rspec)

<br>

## 🚀 Como rodar a aplicação

No seu terminal, clone o projeto:
```sh
git clone https://github.com/Izabellyrb/rebase-labs.git
```

Já dentro do projeto, inicie a aplicação:
```sh
docker compose up
```

Instale as gems necessárias:
```sh
bin/bundle
```

_Caso vá rodar os testes, é necessário rodar o comando abaixo antes seguir para o próximo passo:_
```sh
 docker compose exec app rspec
```

Crie a tabela que será populada rodando o script no terminal:
```sh
docker compose exec app ruby create_table.rb
```

A importação de dados para popular a app pode ser feita de duas formas. Via script:
```sh
docker compose exec app ruby import_from_csv.rb
```

Ou via requisição HTTP no endpoint:
```sh
 curl -d POST http://localhost:3000/import?file=./data.csv
```

A importação dos mesmos dados de forma assíncrona pode ser feita via requisição HTTP no endpoint:
```sh
 curl -d POST http://localhost:3000/import_async?file=./data.csv
```

Após subir o solicitado, na pagína inicial é possível ver a listagem de exames e fazer busca dos exames por Token (http://localhost:3000/). 

<br>


## 💻 Endpoints

### GET /api/mdata
Exibe a api com os dados dos pacientes (100 primeiros).

```json
[{
"id": "1",
"cpf": "048.973.170-88",
"nome_paciente": "Emilly Batista Neto",
"email_paciente": "gerald.crona@ebert-quigley.com",
"data_nascimento_paciente": "2001-03-11",
"endereço_rua_paciente": "165 Rua Rafaela",
"cidade_paciente": "Ituverava",
"estado_patiente": "Alagoas",
"crm_médico": "B000BJ20J4",
"crm_médico_estado": "PI",
"nome_médico": "Maria Luiza Pires",
"email_médico": "denna@wisozk.biz",
"token_resultado_exame": "IQCZ17",
"data_exame": "2021-08-05",
"tipo_exame": "hemácias",
"limites_tipo_exame": "45-52",
"resultado_tipo_exame": "97"
}]
```

### GET /api/mdata/:token
Filtra os resultados de acordo com o token indicado. 

Ex: Busca pelo token `0W9I67`, /api/mdata/0W9I67

```json
[{
"id": "14",
"cpf": "048.108.026-04",
"nome_paciente": "Juliana dos Reis Filho",
"email_paciente": "mariana_crist@kutch-torp.com",
"data_nascimento_paciente": "1995-07-03",
"endereço_rua_paciente": "527 Rodovia Júlio",
"cidade_paciente": "Lagoa da Canoa",
"estado_patiente": "Paraíba",
"crm_médico": "B0002IQM66",
"crm_médico_estado": "SC",
"nome_médico": "Maria Helena Ramalho",
"email_médico": "rayford@kemmer-kunze.info",
"token_resultado_exame": "0W9I67",
"data_exame": "2021-07-09",
"tipo_exame": "hemácias",
"limites_tipo_exame": "45-52",
"resultado_tipo_exame": "28"
}]
```

### POST /import 
Faz a importação de dados para popular a app

Resposta:
```sh
'Arquivo importado!'
```

### POST /import_async
Faz a importação de dados para popular a app de forma assíncrona

Resposta:
```sh
'Arquivo importado com sucesso!'
```

<br>

## 🪜 Etapas da criação do projeto
- [x] Importação dos dados do CSV para o banco de dados SQL (lab 1);
- [x] Exibição da listagem de exames de forma mais amigavel ao usuário no localhost (lab 2);
- [x] Criar endpoint para importar os dados do CSV de forma assíncrona (lab 4)
- [x] Filtrar exames a partir de um token de resultado (lab 3);
  
<br>

## 🚧 Próximos passos
- [ ] Maior cobertura de testes;
- [ ] Otimização dos resultados de buscas;
<br>
<br>

  
 ❗ Para mais detalhes sobre a premissa e as fases do projeto, acesse [`project_instructions`](https://github.com/Izabellyrb/rebase-labs/blob/main/project_instructions.md)

 
