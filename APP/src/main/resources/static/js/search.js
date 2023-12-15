
search = document.getElementById('csv-file-input')
search.oninput = function() {
    document.getElementById('csv-value').innerHTML = search.value;
    process_csv = document.getElementById('process-csv')
    process_csv.classList.add('oninput-button');
    label_input = document.getElementById('label-input')
    label_input.classList.add('oninput-button');
    
    
};
