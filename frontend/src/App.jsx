


function App() {
  async function handleRequest(link, request, json=undefined){

    return fetch(link, {
        method: request,
        body: JSON.stringify(json),
        headers: {"Content-Type": 'application/json; charset=UTF-8'},
    })
    .then(response =>{
        if (response.ok){
           return response.text()
        }
        else{
            alert(`Не выполнен ${request}`)
            throw(`Failed in ${request} request ${link}`)
        }
    })
    .catch(error => {
        throw(`Ошибка: ${error}`)
    })
  }
  
  function test(){
    handleRequest('', 'GET')
    .data(data => {
      console.log(data)
    })
    .error(error => {
      console.log(error)
    })
  }

  return (
    <div>
     <button onClick={test}>тест</button>
    </div>
  );
}

export default App;
