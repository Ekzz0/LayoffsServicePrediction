
function Pagination({currentPage,incrementPage, decrementPage, lastPage}){

    function getButton(event){
        return event.target.className.animVal.split(' ')[0]
    }
   
    

    function handleCLick(event){
        if (getButton(event) === 'rigth'){
            incrementPage()
            
        }
        else if(getButton(event)  === 'left'){
            decrementPage()
        }
    }

    

    return <div className="pagination">
        {currentPage > 1 ? <svg onClick={handleCLick} className="left pagination-left"  width="19" height="12" viewBox="0 0 19 12" fill="none" xmlns="http://www.w3.org/2000/svg"> <path className="left " d="M2.2325 12L9.5 4.583L16.7675 12L19 9.7166L9.5 0L0 9.7166L2.2325 12Z" fill="#F4C430"/> </svg>: ''}
        
        <span className="pagination-start">{currentPage} </span><span className="pagination-text">из</span><span className="pagination-start"> {lastPage}</span>
        {currentPage < lastPage ? <svg onClick={handleCLick}  className="rigth pagination-rigth"  width="19" height="12" viewBox="0 0 19 12" fill="none" xmlns="http://www.w3.org/2000/svg"> <path className="rigth" d="M2.2325 12L9.5 4.583L16.7675 12L19 9.7166L9.5 0L0 9.7166L2.2325 12Z" fill="#F4C430"/> </svg>: ''}
    </div>
}

export { Pagination }