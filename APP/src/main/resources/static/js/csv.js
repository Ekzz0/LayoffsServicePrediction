button = document.getElementById('processCsv')
button.addEventListener('click', handleCSV)

function handleCSV() {
//    let date = new Date();
//    nowDay = date.getDay();
//    nowMonth = date.getMonth();
//    nowFullYear = date.getFullYear()
//    let nowDate = `${nowDay}.${nowMonth}.${nowFullYear}`
    const input = document.getElementById('csvFileInput');
    const file = input.files[0];
    const reader = new FileReader();
    reader.onload = function(file) {
      const csv = file.target.result;
      const json = Papa.parse(csv, { header: true }).data
      console.log(json)
      alert('Ваш файл загружен')
      
      postRequest(json)
    }

    reader.onerror = function() {
        alert("Ошибка во время загрузки файла");
    };
    reader.readAsText(file);
    
}

function postRequest(json){
    fetch('http://localhost:8081/' ,{
        method: 'POST',
        body: JSON.stringify(json),
        headers: {"Content-Type": 'application/json'}
    })
    .then(response => {
        if(response.ok){
            return response.json()
        }
        else{
            throw('Failed in post fetch')
        }
    })
    .then(setTimeout(getRequest, 5000))
    .catch(console.error)

}
