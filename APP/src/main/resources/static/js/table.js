function handle_data(data, link){
    if (link == 'http://localhost:8081/api/send-data'){
        set_table_main(data)
    }
    else{
        console.log(link);
        set_table_admin(data);
    }
}

function set_table_main(data){
    table = document.getElementById('table-body-main')
    table.innerHTML = '';
    for (let item of data){
        top_features = String(item['TopFeatures'])
        top_features = top_features.replace(/,/g,', ')
        table.insertAdjacentHTML('beforeend', `<tr>
        <td class="table__body-id">${item['id']}</td>
        <td class="table__body-prob">${(item['probability']*100).toFixed(1)}%</td>
        <td class="table__body-group">${item['Group']}</td>
        <td class="table__body-feature">${top_features}</td>
        <td class="table__body-details">${item['details']}</td>
        </tr>`)
    }
    modal_person();
    get_request('http://localhost:8081/api/get-history');
}

function set_table_admin(data){
    let table = document.getElementById('table-body-admin');
    const metrics = ['resign', 'not_resign', 'macro_avg','weighted_avg'];
    table.innerHTML = '';
    for (let metric of metrics){
        table.insertAdjacentHTML('beforeend', `<tr>
        <td class="table__body-admin">${metric}</td>
        <td class="table__body-admin">${data[`${metric}`]['precision']}</td>
        <td class="table__body-admin"> ${data[`${metric}`]['recall']}</td>
        <td class="table__body-admin"> ${data[`${metric}`]['f1']}</td>
        <td class="table__body-admin"> ${data[`${metric}`]['support']}</td>
        </tr>`);
    }
    table.insertAdjacentHTML('beforeend', `<tr>
    <td class="table__body-admin">accuracy</td>
        <td class="table__body-admin">${data['accuracy']}</td>
    </tr>`)
    button_fit.addEventListener('click', handle_csv)
    set_button_save()
    
    


}

function set_button_save(){
    
    button_save = document.getElementById('process-save')
    console.log(button_save)
    button_save.classList.toggle('hidden')
    button_save.addEventListener('click', handle_csv)

}

function set_history_tables(data){
    history_select = document.getElementById("history_tables");
    history_select.innerHTML = '';
    for (let item of data.data){
        history_select.insertAdjacentHTML('beforeend',
            `<option>${item}</option>`
        )
    }
    
}

function open_table(){
    button_open = document.getElementById('history_tables')
    button_open = button_open.options[button_open.selectedIndex]
  // Получаем выбранный элемент
    selected_table = button_open.textContent

  // Получаем текстовое содержимое выбранного элемента
    
    get_request(`http://localhost:8081/api/get-predict-by-date?selected_table=${selected_table}`, selected_table)
  // Выводим текстовое содержимое в консоль (или делаем с ним что-то еще)
  console.log(selected_table);

}