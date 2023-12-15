function handle_data(data, link){
    if (link == 'http://localhost:8081/api/send-data'){
        set_table_main(data)
    }
    else{
        set_table_admin(data)
    }
}

function set_table_main(data){
    table = document.getElementById('table-body-main')
    for (let item of data){
        top_features = String(item['TopFeatures'])
        top_features = top_features.replace(/,/g,', ')
        table.insertAdjacentHTML('beforeend', `<tr>
        <td class="table__body-id">${item['id']}</td>
        <td class="table__body-prob">${(item['probability']*100).toFixed(1)}%</td>
        <td class="table__body-group">${item['Group']}</td>
        <td class="table__body-feature">${top_features}</td>
        </tr>`)
        
    }
    modal_person();
}

function set_table_admin(data){
    table = document.getElementById('table-body-admin');
    metrics =  ['class 0', 'class 1', 'accuracy', 'macro avg', 'weighted avg'];
    let index = 0;
    for (let item of data){
        table.insertAdjacentHTML('beforeend', `<tr>
        <td class="table__body-admin">${metrics[index]}</td>
        <td class="table__body-admin"> ${item['precision']}%</td>
        <td class="table__body-admin"> ${item['recall']}</td>
        <td class="table__body-admin"> ${item['f1-score']}</td>
        <td class="table__body-admin"> ${item['support']}</td>
        </tr>`);
        index ++;

        
    }

}