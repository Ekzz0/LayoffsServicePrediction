
function Notification({date, nameFile, closeNotification, text}){
    
    function checkData(){
        if(date){
            return splitDate()
        }
        return nameFile
    }

    function splitDate(){
        return date.split('.')[0].split('T').join(', ')
    }

    return <div className="notification">
        <span onClick={closeNotification} className="notification-close">&times;</span>
        <p className="notification-text">{text} </p>
        <p className="notification-text">{checkData()}</p>
    </div>
}

export { Notification }