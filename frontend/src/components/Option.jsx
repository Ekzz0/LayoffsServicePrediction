
function Option({date}){
    
    function splitDate(){
        return date.split('.')[0].split('T').join(', ')
    }

    return <option value={date}>{splitDate()}</option>
}

export { Option }

