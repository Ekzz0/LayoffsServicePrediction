import { Card } from "./Card"

function Cards({cards, openModal}){

    return <div className="cards">
        {cards.map(card =>
            <Card 
                key={card.id} 
                id={card.id} 
                probability={(card.probability*100).toFixed(1)} 
                departament={card.Group} 
                openModal={openModal} />
        )}
    </div>
}

export { Cards }