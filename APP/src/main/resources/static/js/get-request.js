// get_request('localhost/3131')
get_request('http://45.9.25.230:8081/api/get-history')
function get_request(link, id=undefined){

    fetch(link,{
        method: "GET",
    })
    .then(response => {
        if(response.ok){
            return response.json()
        }
        throw(`Failed in get link ${link} fetch`)
    })
    .then(data => {
        if(link == `http://45.9.25.230:8081/api/persons?id=${id}`){
            diagram(data, 'modal-chart')
        }
        else if(link == 'http://45.9.25.230:8081/api/get-history'){
            set_history_tables(data)
        }
        else if(link == `http://45.9.25.230:8081/api/get-predict-by-date?selected_table=${id}`){
            set_table_main(data.data)
        }else if(link == 'http://45.9.25.230:8081/api/send-report'){
            document.getElementById('send_report')
            .classList.toggle('hidden')
            alert('Данные отправлены на почту')
        }
    })
    .catch(console.error)

}

