import { Main } from "./layout/Main";
import { Sidebar } from "./layout/Sidebar";
import "./scss/index.scss"

function App() {
  
  return (
    <div className="container">
      <Sidebar/>
      <Main/>
    </div>
  );
}

export default App;
