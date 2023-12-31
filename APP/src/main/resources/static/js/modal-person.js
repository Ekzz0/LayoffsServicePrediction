// import {diagram} from './chart.js' 
 // тест

// diagram(['10.1.2000','17.1.2000'],['10','20'],'modal-chart')
function modal_person(){
    persons = document.getElementsByClassName('table__body-id')
    modal = document.getElementById('modal-id')
    persons = Array.from(persons)
    
    for (const index in persons){
        persons[index].addEventListener('click', open_modal)

    }
    function open_modal(event){
        modal.style.display = "block"
        attachModalEvents()
        construct_person(event)
        
    }

    function construct_person(event){
        data = event.target.parentElement
        person_info = new constructor_modal()
        person_info.construct(data,'.table__body-id', 'person-id')
        person_info.construct(data,'.table__body-prob', 'person-variable')
        person_info.construct(data,'.table__body-group', 'person-group')
        person_info.construct(data,'.table__body-feature', 'person-feature')
        person_info.construct(data,'.table__body-details', 'person-details')
    }

    class constructor_modal{
        construct(data, table_сell, model_cell) {
            let table_value = data.querySelector(table_сell);
            let modal_content = document.getElementById(model_cell);
            modal_content.textContent = table_value.textContent;
            console.log(data)
            console.log(modal_content.textContent)
            console.log(table_value.textContent)
            if (model_cell == 'person-id'){
                let id = modal_content.textContent;
                console.log(`http://45.9.25.230:8081/api/persons/${id}`);
                get_request(`http://45.9.25.230:8081/api/persons?id=${id}`, id);
            }
        }
    }

    function attachModalEvents(){
        modal.querySelector(".modal-person__back").addEventListener('click', closeModal)
        modal.querySelector(".modal-person__cross").addEventListener('click', closeModal)
        document.addEventListener('keydown', handleEscape)
        modal.addEventListener('click', handleClickCLose)
    }

    function handleClickCLose(event){
        if (event.target === modal){
            closeModal()
        }
    }

    function handleEscape(event){
        if (event.key === 'Escape'){
            closeModal()
        }
    }

    function closeModal(){
        modal.style.display = "none"
        removeModalEvents()
    }

    function removeModalEvents(){
        modal.querySelector(".modal-person__back").removeEventListener('click', closeModal)
        modal.querySelector(".modal-person__cross").removeEventListener('click', closeModal)
        document.removeEventListener('keydown', handleEscape)
        modal.removeEventListener('click', handleClickCLose)
    }

}
    