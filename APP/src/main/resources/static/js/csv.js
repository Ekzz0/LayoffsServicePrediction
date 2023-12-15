
button_submit = document.getElementById('process-csv')
button_submit.addEventListener('click', handle_csv)

button_fit = document.getElementById('process-fit')
button_fit.addEventListener('click', handle_csv)

function handle_csv(event) {

    const input = document.getElementById('csv-file-input');
    const file = input.files[0];
    const reader = new FileReader();

    reader.onload = function(file) {
      const csv = file.target.result;
      const json = Papa.parse(csv, { header: true }).data
      if(event.target == button_submit){
        post_request(json, 'http://localhost:8081/api/send-data')
      }
      else{
        post_request(json, 'http://localhost:8081/api/fit')
      }
      
    }

    reader.onerror = function() {
        alert("Ошибка во время загрузки файла");
    };
    reader.readAsText(file);
    
}

function post_request(json, link){
    
    fetch(link ,{
        method: 'POST',
        body: JSON.stringify(json),
        headers: {"Content-Type": 'application/json'}
    })
    .then(response => {
        // if(response.ok){
        //     alert('Ваш файл загружен')
        //     return response.json()
        // }
        if (!response.ok){   //test
            alert('Ваш файл загружен')
            return {"status":200,"data":[{"id":2801,"probability":0.0003135796869173646,"Group":"Development Department","TopFeatures":["SentMessages","answered_messages","VacationMentioned","ReceivedMessages","unreplied_messages","text_length"]},{"id":2801,"probability":0.0003135796869173646,"Group":"Development Department","TopFeatures":["SentMessages","answered_messages","VacationMentioned","ReceivedMessages","unreplied_messages","text_length","MessagesReadLater"]}],"dates":{"dates": ['10.1.2000','12.1.2000'], "probability": ['10', '12']}}
        }
        else{
            alert('Файл не был загружен');
            throw('Failed in post fetch');
        }
    })
    .then(data =>{
        console.log(data)
        console.log(data.data)
        handle_data(data.data, link)
        if (link == 'http://localhost:8081/api/send-data'){
            console.log(data.dates)
            diagram(data.dates,'my-chart')
        }
        
        // diagram(data,'my-chart')
         
    })
    .catch(console.error)

}
