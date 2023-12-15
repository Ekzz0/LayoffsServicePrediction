
search = document.getElementById('csv-file-input')
search.oninput = function() {
    document.getElementById('csv-value').innerHTML = search.value;
    processCsv = document.getElementById('process-csv')
    processCsv.classList.add('oninput-button');
    label_input = document.getElementById('label-input')
    label_input.classList.add('oninput-button');
    
    
};
