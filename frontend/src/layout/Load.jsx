import { Component } from "react"
import { LoadFile } from "../components/LoadFile"
import { Instruction } from "../components/Instruction"

class Load extends Component{

    render(){
    const {  updateCurrentDate } = this.props

    return <div className="content">
        <div className="window">
            <LoadFile updateCurrentDate={updateCurrentDate}/>
        </div>
        <div className="window ">
            <Instruction/>
        </div>
    </div>
    }
}
export { Load }