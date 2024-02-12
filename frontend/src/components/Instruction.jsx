
function Instruction(){
    // return <div className="instruction">
    //     <h2 className="instruction-title">Инстркция по ипользованию</h2>
    //     <ol className="instruction-list">
    //         {list.map((item) => 
    //             <li>{item}</li>
    //         )}
    //     </ol>
    // </div>
    return <div className="instruction">
    <h2 className="instruction-title">Инстркция по ипользованию</h2>
    <ol className="instruction-list">
        <li className="instruction-item"><span>При нажатии на кнопку </span><button>N</button> будет сортировка по номеру сотрудника</li>
        <li className="instruction-item"><span>При нажатии на кнопку </span><button>N</button> будет сортировка по вероятности увольнения</li>
        <li className="instruction-item"><span>При нажатии на кнопку </span><button>N</button> будет сортировка по поиск по департаменту</li>
        <li className="instruction-item"><span>При нажатии на карточку сотрудника отобразиться окно с полной информацией о сотруднике</span></li>
    </ol>
</div>
}

export { Instruction }