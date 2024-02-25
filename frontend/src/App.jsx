import { Main } from "./layout/Main";
import { Sidebar } from "./layout/Sidebar";
import "./scss/index.scss"
import React, { Component } from "react";

class App extends Component {
  
  state = {
    dashboard: true,
    choice: false,
    load: false,
  }

  toggleContent = (dashboard, load, choice) => {
    if(!(dashboard === this.state.dashboard & choice===this.state.choice & load === this.state.load)) {
      this.setState({dashboard: dashboard, load: load , choice: choice})
    }
  }

  toggleTabs = (tab) => {
    return this.state[tab]
  }

  render(){
  
  return (
     
      <div className="container">
        <Sidebar toggleContent={this.toggleContent} toggleTabs={this.toggleTabs} />
        <Main tab={this.state}/>
      </div>
    );
  }
}

export { App }
