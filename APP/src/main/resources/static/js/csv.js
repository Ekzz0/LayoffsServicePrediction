button = document.getElementById('processCsv')
button.addEventListener('click', handleCSV)

function handleCSV() {
    const input = document.getElementById('csvFileInput');
    const file = input.files[0];
    const reader = new FileReader();
    reader.onload = function(file) {
      const csv = file.target.result;
      const json = Papa.parse(csv, { header: true }).data
      postRequest(json)
    }

    reader.onerror = function() {
        alert("Ошибка во время загрузки файла");
    };
    reader.readAsText(file);
    
}

function postRequest(json){
    fetch('http://localhost:8081/api/send-data' ,{
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
            alert('Файл не был загружен')
            throw('Failed in post fetch')
        }
    })
    .then(data =>{
        data = JSON.parse(data)
        setTable(data)
    })
    .catch(console.error)

}
