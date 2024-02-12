import { Main } from "./layout/Main";
import { Sidebar } from "./layout/Sidebar";
import "./scss/index.scss"
import React, { Component } from "react";

class App extends Component {
  
  state = {
    
  }

  render(){

  
  return (
      <div className="container">
        <Sidebar/>
        <Main/>
      </div>
    );
  }
}

export { App }
