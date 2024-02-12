import { Card } from "./Card"

function Cards({cards}){

    return <div>
        {cards.map(card => 
            <Card data={card}/>
        )}
    </div>
}

export { Cards }