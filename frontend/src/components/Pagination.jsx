
function Pagination(){

    return <div className="pagination">
    <svg className="pagination-left hidden"  width="19" height="12" viewBox="0 0 19 12" fill="none" xmlns="http://www.w3.org/2000/svg"> <path className="pagination-vector" d="M2.2325 12L9.5 4.583L16.7675 12L19 9.7166L9.5 0L0 9.7166L2.2325 12Z" fill="red"/> </svg>
        <span className="pagination-start">1 </span><span className="pagination-text">из</span><span className="pagination-start"> 10</span>
        <svg className="pagination-rigth"  width="19" height="12" viewBox="0 0 19 12" fill="none" xmlns="http://www.w3.org/2000/svg"> <path className="pagination-vector" d="M2.2325 12L9.5 4.583L16.7675 12L19 9.7166L9.5 0L0 9.7166L2.2325 12Z" fill="red"/> </svg>
    </div>
}

export { Pagination }