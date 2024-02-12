import { LineChart } from "../components/LineChart";
import { Filter } from "../components/Filter";
import { Pagination } from "../components/Pagination"
import { Instruction } from "../components/Instruction";
import { Cards } from "../components/Cards";
import { Api } from "../api/Api";
import React, { Component } from "react";

class Dashboard extends Component{

    state = {
        cards: [],

    }

    componentDidMount(){
        this.getCards()
    }

    getCards(){
        this.setState({cards: [{id: 1, probability:10, departament:'Маркетинг'}]})
        Api(`http://45.9.25.230:8081/api/get-predict-by-date?selected_table=1`)
        .then(data => { 
            
            this.setState({cards: data.data})
        })
        .catch(error=>{
            console.log(error)
        }
        )
    }

    render(){
    const cards = this.state.cards
    return <div className="content">
        <div className="window">
            <Filter/>
            {cards ? <Cards cards={cards}/>: <Instruction/>} 
            <Pagination/>
        </div>
        <div className="window ">
            <LineChart/>
            <Instruction/>
        </div>
    </div>
}
}

export { Dashboard }