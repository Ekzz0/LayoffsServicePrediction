function setTable(persons){
    table = document.getElementById('table-body')
    for (let person of persons){
        info = []
        for (let data in person){
            info.push(person[data])
        }{
            table.insertAdjacentHTML('beforeend', `<tr>
            <td class="table__body-id">${info[0]}</td>
            <td class="table__body-prob">${(info[1]*100).toFixed(1)}%</td>
            <td class="table__body-group">${info[3]}</td>
            <td class="table__body-feature">${info[2]}</td>
            </tr>`)
        }
    }
    modal_person();
}
