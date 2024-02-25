import { Component } from "react"
import Papa from 'papaparse';
import { Api } from "../api/Api";
import { Notification } from "./Notifiacation";
import { Preloader } from "./Preloader";

class LoadFile extends Component{

    state = {
        csvData : '',
        nameFile : '',
        notification : false,
        preloader: false,
    }

    getFile(event){
        return event.target.files[0];
    }

    splitName(name){
        return name.split("\\").pop();
    }

    getName(event){
        const name = event.target.value
        return this.splitName(name)
    }

    changeNameFile = (event) => {
        this.setState({nameFile: this.getName(event)})
    }

    handleChangeInput = (event) =>{
        this.changeNameFile(event)
        const file = this.getFile(event)
        const reader = new FileReader();

        reader.readAsText(file);

        reader.onload = (event) => {
            const contents = event.target.result;
            this.setState({csvData: contents})
        };
    }

    CsvToJson = () => {
        return Papa.parse(this.state.csvData, { header: true }).data
    }

    sendJson(json){
        Api('http://localhost:8081/api/send-data', 'POST', json)
        .then(() => {
            this.setState({preloader: false})
            this.viewNotification()
            this.props.updateCurrentDate('')
        })
        .catch((error) =>{
            console.log(error)
        })
        
    }

    handleClick = () => {
        this.setState({preloader: true})
        const json = this.CsvToJson()
        this.sendJson(json)
    }

    viewNotification = () =>{
        this.setState({notification: true})
    }
    
    closeNotification = () =>{
        this.setState({notification: false})
    }
       
    render(){
        const { nameFile, notification, preloader } = this.state

        return <div>
            {preloader ? <Preloader/> :
            <label className="input-data__block" id="label-input">
                <input onChange={this.handleChangeInput}  className="hidden" type="file" name="fileCsv" accept=".csv" id="csv-file-input" />
                <span className="input-data__value" id="csv-value">{nameFile ? nameFile: 'Поиск файла'}</span>
                <button onClick={this.handleClick} className="input-data__submit" id="process-csv">Отправить</button>
            </label>}
            {notification? <Notification closeNotification={this.closeNotification} nameFile={nameFile} text={'Загружен файл с названием: '}/>:''}
            
        </div>
    }
}

export { LoadFile }