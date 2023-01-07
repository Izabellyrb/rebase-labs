const fragment = new DocumentFragment();
const url = 'http://localhost:3000/api/mdata';
const results = document.getElementById("results")

fetch(url)
    .then((response) => {
        return response.json()
    })
    .then((exams) => {
        exams.forEach(exam => {
            results.innerHTML +=`
                <tr id="line"> 
                    <td>${exam.token_resultado_exame}</td>
                    <td>${exam.crm_médico}</td>
                    <td>${exam.nome_paciente}</td>
                    <td>${exam.cpf}</td>
                    <td>${exam.endereço_rua_paciente}</td>
                    <td>${exam.cidade_paciente}</td>
                    <td>${exam.estado_patiente}</td>
                    <td>${exam.tipo_exame}</td>
                    <td>${exam.limites_tipo_exame}</td>
                    <td>${exam.resultado_tipo_exame}</td>
                </tr>`
        })
    })
    .catch((error) => {
    alert("Ocorreu um erro ao carregar os dados. Tente novamente mais tarde.", error)
  })