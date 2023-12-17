// get_request('localhost/3131')
get_request('http://localhost:8081/api/get-history')
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
        if(link == `http://localhost:8081/api/persons?id=${id}`){
            console.log(data)
            diagram(data, 'modal-chart')
        }
        else if(link == 'http://localhost:8081/api/get-history'){
            set_history_tables(data)
        }
        else if(link == `http://localhost:8081/api/get-predict-by-date?selected_table=${id}`){
            console.log(id)
            set_table_main(data.data)
        }
    })
    .catch(console.error)

}

