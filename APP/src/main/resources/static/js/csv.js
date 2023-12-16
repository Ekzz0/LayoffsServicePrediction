
button_submit = document.getElementById('process-csv')
button_submit.addEventListener('click', handle_csv)

button_fit = document.getElementById('process-fit')
button_fit.addEventListener('click', handle_csv)

function handle_csv(event) {
    
    const input = document.getElementById('csv-file-input');
    const file = input.files[0];
    const reader = new FileReader();
    console.log(file.name)
    reader.onload = function(file) {
      const csv = file.target.result;
      const json = Papa.parse(csv, { header: true }).data
    //   const trimJson = json.slice(0,-1)
    //   console.log(trimJson)
      if(event.target == button_submit){
        post_request(json, 'http://localhost:8081/api/send-data')
      }
      else if(event.target == button_fit) {
        post_request(json, 'http://localhost:8081/api/fit')
      }
      else{
        post_request(file.name, 'http://localhost:8081/api/save')
      }
      
    }

    reader.onerror = function() {
        alert("Ошибка во время загрузки файла");
    };
    reader.readAsText(file);
    
}

function post_request(json, link){
    if (link == 'http://localhost:8081/api/fit'){
        button_fit.removeEventListener('click', handle_csv);
    }
    fetch(link ,{
        method: 'POST',
        body: JSON.stringify(json),
        headers: {"Content-Type": 'application/json'}
    })
    .then(response => {
        if(response.ok){
            alert('Ваш файл загружен')
            return response.json()
        }
        
        else{
            alert('Файл не был загружен');
            throw(`Failed in post ${link} fetch`);
        }
    })
    .then(data =>{
        console.log(data)
        console.log(data.data)
        if (link == 'http://localhost:8081/api/send-data'){

        }else{
            handle_data(data.data, link)
            if (link == 'http://localhost:8081/api/send-data'){
                console.log(data.dates)
                diagram(data.dates,'my-chart')
            }
        
        }
        // handle_data(data.data, link)
        // if (link == 'http://localhost:8081/api/send-data'){
        //     console.log(data.dates)
        //     diagram(data.dates,'my-chart')
        // }
        
        // diagram(data,'my-chart')
         
    })
    .catch(console.error)

}
