import { LineChart } from "./LineChart" 
import { useEffect } from "react"
import { useRef } from "react"

function Modal({personData, closeModal}){
    
    const modalRef = useRef(null)
    
    useEffect(() =>{
        modalRef.current.focus()
    })

    function handleEvent(event){
        if (event.type === 'click'){
            handleClick(event)
        } else if (event.type === 'keydown'){
            handleKeyDown(event)
        }
        
    }
    
    function handleKeyDown(event){
        if(checkKey(event.key)){
            closeModal()
        }
    }

    function checkKey(key){
        return  key === 'Escape'? true : false 
    }

    function handleClick(event){
        if (checkClass(getClassName(event))){
            closeModal()
        }
    }

    function getClassName(event){
        return event.target.className
    }

    function checkClass(className){
        if (['modal', 'modal-back', 'modal-close'].includes(className)){
            return true
        }
        else if (['modal-vector', 'modal-path'].includes(className.baseVal)){
            return true
        }
    }
    

    return <div onClick={handleEvent} onKeyDown={handleEvent} tabIndex={0} ref={modalRef} className="modal">
        <div className="modal-content">
                <div className="modal-header">
                    <div className="">
                        <svg  className="modal-vector" width="19" height="12" viewBox="0 0 19 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path className="modal-path" d="M2.2325 12L9.5 4.583L16.7675 12L19 9.7166L9.5 0L0 9.7166L2.2325 12Z" fill="#F4C430"/>
                        </svg>
                        <span className="modal-back">назад</span>
                    </div>
                    <span className="modal-close">&times;</span>
                </div>
                <div className="modal-info">
                    <div className="modal-chart">
                        <LineChart days={personData.dates} probabilities={personData.probability} title={''}/>
                    </div>
                    <div className="modal-list">
                        <p className="modal-list__item">Идентификатор: <span>{personData.employeeId}</span></p>
                        <p className="modal-list__item">Вероятность: <span>{(personData.currentProbability*100).toFixed(1)}%</span></p>
                        <p className="modal-list__item">Группа: <span>{personData.department}</span></p>
                        <p className="modal-list__item">На что следует обратить внимание:</p>
                        <p className="modal-list__item">{personData.topFeatures ? personData.topFeatures.join(', '): ''}</p>
                    </div>
                </div>
                <div className="modal-details">
                    <p>Details: </p>
                    <span>{personData.details}</span>
                </div>
        </div>
    </div>
}


export { Modal }