function setTable(persons){
    table = document.getElementById('table-body')
    for (let person of persons){
        table.insertAdjacentHTML('beforeend', `<tr>
        <td class="table__body-id">${person['id']}</td>
        <td class="table__body-prob">${(person['probability']*100).toFixed(1)}%</td>
        <td class="table__body-group">${person['Group']}</td>
        <td class="table__body-feature">${person['TopFeatures']}</td>
        </tr>`)
        
    }
    modal_person();
}
