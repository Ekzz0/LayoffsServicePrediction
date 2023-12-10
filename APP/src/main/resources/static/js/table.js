persons = [{"id":"1014","probability":0.0003883827,"Group":"Quality Assurance"},{"id":"1044","probability":0.0001027473,"Group":"Sales and Marketing"}];
setTable(persons)

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