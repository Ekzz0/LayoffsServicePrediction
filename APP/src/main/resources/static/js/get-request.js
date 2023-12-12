getRequest('http://localhost:8081/')
function getRequest(link){
    
    let info = fetch(link,{
        method: "GET",
    })
    .then(response => {
        if(response.ok){
            return response.json()
        }
        throw(`Failed in get link ${link} fetch`)
    })
    .then(data => {
        return JSON.parse(data)
    })
    .catch(console.error)

    return info
}

