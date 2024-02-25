
import { Dashboard } from "./Dashboard";
import { Choice } from "./Choice";
import { Load } from "./Load";
import { Component } from "react";

class Content extends Component{
    
    state = {
        currentDate : '',

    }

    updateCurrentDate = (newDate) =>{
        this.setState({currentDate: newDate})
    }

    toggleTab({dashboard, choice, load}){
        if(dashboard){
            return this.state.currentDate ? <Dashboard currentDate= {this.state.currentDate}/> : <Dashboard/>
        }
        else if(choice){
            return <Choice updateCurrentDate= {this.updateCurrentDate}/>
        }
        else if(load){
            return <Load  updateCurrentDate= {this.updateCurrentDate}/>
        }
    }

    render(){
        const {tab} = this.props
        return <div className="content">
        {this.toggleTab(tab)}
    </div>
    }
}

export { Content }