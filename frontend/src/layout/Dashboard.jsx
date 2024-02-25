import { LineChart } from "../components/LineChart";
import { Filter } from "../components/Filter";
import { Pagination } from "../components/Pagination"
import { Instruction } from "../components/Instruction";
import { Cards } from "../components/Cards";
import { Preloader } from "../components/Preloader";
import { Api } from "../api/Api";
import React, { Component } from "react";
import { Modal } from "../components/Modal";

class Dashboard extends Component{

    state = {
        currentDate: '',
        currentPage: 1,
        lastPage: 2,
        cards: undefined,
        modal: false,
        personData: {},
    }

    componentDidMount(){
        if (this.props.currentDate){
           this.setCurrenDate(this.props.currentDate)
        } else {
            this.getCurrentDate()
        }
    }

    setCurrenDate = (newDate) => {
        this.setState({currentDate: newDate}, () =>  this.getCards())
    }

    getLastDate = (data) => {
        return String(data.data.slice(-1))
    }

    getCurrentDate(){
        Api('http://localhost:8081/api/get-history','GET')
        .then(data => {
            this.setCurrenDate(this.getLastDate(data))
        })
        .catch(error => {
            console.log(error)
        })
    }

    getPersonData(id){
        Api(`http://localhost:8081/api/persons?id=${id}&date=${this.state.currentDate}`,'GET')
        .then(data => {
            this.setState({personData: data})
        })
        .catch(error=>{
            console.log(error)
        }
        )
    }

    openModal = (id) => {
        this.getPersonData(id)
        this.setState({ modal:true })
    }
    
    closeModal = () => {
        this.setState({ modal:false })
    }

    getCards(){
        Api(`http://localhost:8081/api/predict-with-page?selected_table=${this.state.currentDate}&page=${this.state.currentPage-1}`)
        .then(data => {
            this.setState({cards: data.data})
        })
        .catch(error=>{
            console.log(error)
        }
        )
    }

    incrementPage = () => {
        this.setState({currentPage: this.state.currentPage+1},() => {this.getCards()})
        
    }

    decrementPage = () => {
        this.setState({currentPage: this.state.currentPage-1}, () => {this.getCards()})
        
    }
    
    render(){
    const {cards, currentPage, lastPage, modal, personData} = this.state

    return <div className="content">
        <div className="window">
            <Filter/>
            {cards ? <Cards cards={cards} openModal={this.openModal}/>: <Preloader/>}
            <Pagination currentPage={currentPage} lastPage={lastPage} incrementPage={this.incrementPage} decrementPage={this.decrementPage}/>
            
        </div>
        <div className="window ">
            <LineChart days={[]} probabilities={[]} title={'Общий график сотрудников'}/>
            <Instruction/>
        </div>
        { modal ? <Modal personData={personData} closeModal={this.closeModal}/>: null}
    </div>
    
}
}

export { Dashboard }