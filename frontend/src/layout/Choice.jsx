import { Api } from "../api/Api"
import React from "react"
import { Options } from "../components/Options"
import { Instruction } from "../components/Instruction"

class  Choice extends React.Component{

    state = {
        listPredicts : [],
    }

    componentDidMount(){
        this.getListPredicts()
    }

    getListPredicts(){
        Api('http://localhost:8081/api/get-history')
        .then(data =>{
            this.setState({listPredicts: data.data})
        })
        .catch( error => {
            console.log(error)
        })
    }

    render(){
    const { listPredicts, } = this.state
    const { updateCurrentDate } = this.props

    return <div className="content">
        <div className="window">
            <div className="choice" id="table-list">
                {listPredicts ? <Options updateCurrentDate={ updateCurrentDate } listPredicts={listPredicts}/>: ''}
            </div>
        </div>
        <div className="window ">
            <Instruction/>
        </div>
        
    </div>
    }
}

export { Choice }