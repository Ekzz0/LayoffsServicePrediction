import React from "react"
import { Content } from "./Content"
import { Header } from "./Header"

function Main(props){
    
    const {tab} = props
    
    
    
    return <div className="main">
        <Header/>
        <Content tab={tab}/>
    </div>
    
}

export { Main }