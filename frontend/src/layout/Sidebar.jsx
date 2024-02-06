import choice from '../images/choice1.svg'
import dashboard from '../images/dashboard.svg'
import load from '../images/load.svg'
import profile from '../images/profile.svg'
import quit from '../images/quit.svg'

function Sidebar(){
    
    return <div className="sidebar">
        <nav className="nav">
            <ul className="nav-list">
                <li className="nav-list__item active">
                    <img src={dashboard} alt="dashboard" />
                    <span className='nav-list__text'>Дашборд</span>
                </li>
                <li className="nav-list__item">
                    <img src={choice} alt="choice" />
                    <span className='nav-list__text'>Загрузка</span>
                </li>
                <li className="nav-list__item">
                    <img src={load} alt="load" />
                    <span className='nav-list__text'>Выбор</span>
                </li>
                <li className="nav-list__item">
                    <img src={profile} alt="profile" />
                    <span className='nav-list__text'>Профиль</span>
                </li>   
                <li className="nav-list__item">
                    <img src={quit} alt="quit" />
                    <span className='nav-list__text'>Выход</span>
                </li>
            </ul>
        </nav>
    </div>
}

export { Sidebar }