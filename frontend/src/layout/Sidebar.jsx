
import imgChoice from '../images/choice1.svg'
import imgDashboard from '../images/dashboard.svg'
import imgLoad from '../images/load.svg'
import imgProfile from '../images/profile.svg'
import imgQuit from '../images/quit.svg'

function Sidebar(props){

    const {toggleContent, toggleTabs} = props

    function getName(event){
        return event.currentTarget.querySelector('span').outerText
    }

    function handleClick(event){
        if(getName(event) === 'Дашборд'){
            toggleContent(true, false, false)
        }
        else if (getName(event) === 'Загрузка'){
            toggleContent(false, true, false)
        }
        else{
            toggleContent(false, false, true)
        }
       
    } 

    return <div className="sidebar">
        <nav className="nav">
            <ul className="nav-list">
                <li onClick={handleClick} className={`nav-list__item ${toggleTabs('dashboard') ? 'active': ''}`}>
                    <img src={imgDashboard} alt="dashboard" />
                    <span className='nav-list__text'>Дашборд</span>
                </li>
                <li onClick={handleClick} className={`nav-list__item ${toggleTabs('load') ? 'active': ''}`}>
                    <img src={imgChoice} alt="choice" />
                    <span className='nav-list__text'>Загрузка</span>
                </li>
                <li onClick={handleClick}  className={`nav-list__item ${toggleTabs('choice') ? 'active': ''}`}>
                    <img src={imgLoad} alt="load" />
                    <span className='nav-list__text'>Выбор</span>
                </li>
                <li className="nav-list__item">
                    <img src={imgProfile} alt="profile" />
                    <span className='nav-list__text'>Профиль</span>
                </li>   
                <li className="nav-list__item">
                    <img src={imgQuit} alt="quit" />
                    <span className='nav-list__text'>Выход</span>
                </li>
            </ul>
        </nav>
    </div>
    
}

export { Sidebar }