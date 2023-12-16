// get_request('localhost/3131')
function get_request(link, id){

    fetch(link,{
        method: "GET",
    })
    .then(response => {
        if(!response.ok){
            return response.json()
        }
        // if(!response.ok){  // test
            
        //     return {"status":200,"data":{"dates": ['10.1.2000','12.1.2000'], "probability": ['10', '12']}}
        // }
        throw(`Failed in get link ${link} fetch`)
    })
    .then(data => {
        if(link == `http://localhost:8081/api/persons/${id}`){
            console.log(data)
            diagram(data, 'modal-chart')
        }
        console.log(data.data)
    })
    .catch(console.error)

}

