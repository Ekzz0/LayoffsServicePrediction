import vector from '../images/vector.svg';
import lupa from '../images/lupa.svg';

function Filter(){

    return <div className="filter">
    <div className="filter-button ">
        <span className="filter-text button-n">N</span>
        <div className="vector">
            <img className="vector-most" src={vector} alt="" />
            <img className="vector-least" src={vector} alt="" />
        </div>
    </div>
        <div className="filter-button">
            <span className="filter-text">Вероятность увольнения</span>
            <div className="vector">
                <img className="vector-most" src={vector} alt="" />
                <img className="vector-least" src={vector} alt="" />
            </div>
        </div>
        <div className="filter-button">
            <span className="filter-text">Департамент</span>
            <img src={lupa} alt="" />
        </div>
    </div>
}

export { Filter }