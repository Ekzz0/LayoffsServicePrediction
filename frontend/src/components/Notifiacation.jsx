
function Notification({date, nameFile, closeNotification, text}){
    
   
    function splitDate(){
        return date.split('.')[0].split('T').join(', ')
    }

    return <div className="notification">
        <span onClick={closeNotification} className="notification-close">&times;</span>
        <p className="notification-text">{text} </p>
        <p className="notification-text">{date ? splitDate(): nameFile}</p>
    </div>
}

export { Notification }