import { Component } from "react"
import { Option } from "./Option"
import { Notification } from "./Notifiacation"
    
class Options extends Component{

    state = {
        select : '',
        notification : false,

    }

    handleSelect = (event) => {
        this.closeNotification();
        this.setState({select: event.target.value})
    }

    checkSelect = () => {
        return this.state.select ? true : false;
    }

    getFirstPredict = () => {
        
        return this.props.listPredicts[0]
    }

    handleClick = (event) => {
        event.preventDefault()
        this.getCurrentSelect()
        this.viewNotification()
    }

    viewNotification =() =>{
        this.setState({notification: false} ,() => this.setState({notification: true}))
    }

    closeNotification = () =>{
        this.setState({notification: false})
    }

    getCurrentSelect = () =>{
        const {updateCurrentDate} = this.props
        if (this.checkSelect()){
            updateCurrentDate(this.state.select)
            
        } else if (!this.checkSelect()){
            updateCurrentDate(this.getFirstPredict())
        }
        
    }


    getDate(){
        return this.checkSelect() ? this.state.select: this.getFirstPredict()
    }

    render(){
    const {listPredicts} = this.props
    const { notification } = this.state
    
    return  <form>
        <select onChange={this.handleSelect} className="choice-list" name="tables" id="history_tables">
            <option disabled>Выберите отчёт</option>
            {listPredicts.map(date =>
                <Option key={date} date={date}/>
            )}
        </select>
        <button onClick={this.handleClick} className="input-data__submit" id="open_table">Open</button>
        {notification ? <Notification text={'Был загружен отчёт с датой:'} closeNotification={this.closeNotification}  date={this.getDate()}/> : ''}
    </form>
    }
}

export { Options }