import frame from '../images/frame.svg'


function Card({id, probability, departament}){

    return <div className="card">
        <h2>{id}</h2>
        <img src={frame} alt="frame" />
        <p>{probability}%</p>
        <p>{departament}</p>
    </div>
}

export { Card }