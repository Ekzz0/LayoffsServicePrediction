import logo from '../images/logo.svg'
import frame from '../images/frame.svg'

function Header(){
    return <div className="header">
        <img className='header-logo' src={logo} alt="logo" />
        <img className='header-profile' src={frame} alt="profile" />
    </div>
}

export { Header }