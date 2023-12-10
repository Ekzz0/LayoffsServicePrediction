
search = document.getElementById('csvFileInput')
search.oninput = function() {
    document.getElementById('csv-value').innerHTML = search.value;
    processCsv = document.getElementById('processCsv')
    processCsv.classList.add('oninput-button');
    label_input = document.getElementById('label-input')
    label_input.classList.add('oninput-button');
    
    
};
