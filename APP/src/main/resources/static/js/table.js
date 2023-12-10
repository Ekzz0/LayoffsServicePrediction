

function setTable(persons){
    table = document.getElementById('table-body')
    for (let person of persons){
        console.log(person)
        info = []
        for (let data in person){
            console.log(person[data])
            info.push(person[data])
        }{
            table.insertAdjacentHTML('beforeend', `<tr>
            <td class="table__body-id">${info[0]}</td>
            <td class="table__body-prob">${info[1].toFixed(2)*100}</td>
            <td class="table__body-group">${info[2]}</td>
            </tr>`)
        }

    }
}