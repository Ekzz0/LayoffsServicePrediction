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
        // if(!response.ok){  // test
            
        //     return {"status":200,"data":{"dates": ['10.1.2000','12.1.2000'], "probability": ['10', '12']}}
        // }
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
        // console.log(data)
        // console.log(link)
        // console.log(`http://localhost:8081/api/persons?=${id}`)
    })
    .catch(console.error)

}

