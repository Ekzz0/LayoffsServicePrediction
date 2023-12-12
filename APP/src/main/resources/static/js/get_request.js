function getRequest(){
    
    fetch('http://localhost:8081/',{
        method: "GET",
    })
    .then(response => {
        if(response.ok){
            return response.json()
        }
        throw('Failed in get fetch')
    })
    .then(data => {
        handleData(data)
    })
    .catch(console.error)
}

function handleData(data){
    result = []
    for (let key in data){
        value = data[key]
        result.push(key, value)
    }
    console.log(result)
}