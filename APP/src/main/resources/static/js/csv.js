
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
        // if (!response.ok){   //test
        //     alert('Ваш файл загружен')
        //     return {"status":200,"data":[{"id":2801,"probability":0.0003135796869173646,"Group":"Development Department","TopFeatures":["SentMessages","answered_messages","VacationMentioned","ReceivedMessages","unreplied_messages","text_length"]},{"id":2801,"probability":0.0003135796869173646,"Group":"Development Department","TopFeatures":["SentMessages","answered_messages","VacationMentioned","ReceivedMessages","unreplied_messages","text_length","MessagesReadLater"]}],"dates":{"dates": ['10.1.2000','12.1.2000'], "probability": ['10', '12']}}
        // }
        // if (!response.ok){   //test
        //     alert('Ваш файл загружен');
        //     return {
        //         "status": 200,
        //         "data": {
        //           "first": {
        //             "precision": 0.7368421052631579,
        //             "recall": 0.875,
        //             "f1": 0.7999999999999999,
        //             "support": 16
        //           },
        //           "second": {
        //             "precision": 0.8181818181818182,
        //             "recall": 0.6428571428571429,
        //             "f1": 0.7200000000000001,
        //             "support": 14
        //           },
        //           "macro_avg": {
        //             "precision": 0.777511961722488,
        //             "recall": 0.7589285714285714,
        //             "f1": 0.76,
        //             "support": 30
        //           },
        //           "weighted_avg": {
        //             "precision": 0.7748006379585327,
        //             "recall": 0.7666666666666667,
        //             "f1": 0.7626666666666667,
        //             "support": 30
        //           },
        //           "accuracy": 0.7666666666666667
        //         }
        //       }
        // }
        else{
            alert('Файл не был загружен');
            throw(`Failed in post ${link} fetch`);
        }
    })
    .then(data =>{
        console.log(data)
        console.log(data.data)
        if (link == 'http://localhost:8081/api/save'){

        }else{
            handle_data(data.data, link)
            // if (link == 'http://localhost:8081/api/send-data'){
            //     console.log(data.dates)
            //     diagram(data.dates,'my-chart')
            // }
        
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
