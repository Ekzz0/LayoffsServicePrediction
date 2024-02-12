import frame from '../images/frame.svg'


function Card({id, probability, departament}){
    
    return <div className="card">
        <h2 className='card-id'>{id}</h2>
        <img src={frame} alt="frame" />
        <p className='card-prob'>{probability}%</p>
        <p className='card-dep'>{departament}</p>
    </div>
}

export { Card }