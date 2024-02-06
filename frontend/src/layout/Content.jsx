import { Card } from "../components/Card"
import { Chart } from "../components/Chart"

function Content(){
    // разделение на контент

    const id = '1';
    const probability = '10';
    const departament = 'Маркетинг'
    
    return <div className="content">
        <div className="window">
            <Card id={id} probability={probability} departament={departament}/>
        </div>
        <div className="window">
            <Chart/>
        </div>
    </div>
}

export { Content }