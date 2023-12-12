persons = document.getElementsByClassName('table__body-id')
modal = document.getElementById('modal-id')
persons = Array.from(persons)

for (const index in persons){
    persons[index].addEventListener('click', open_modal)
}

function open_modal(event){
    modal.style.display = "block"
    attachModalEvents()
    get_person(event)
    set_diagram(["10.1.2000","17.1.2000"], ["5","10"],"modal-chart")
}


function get_person(event){
    data = event.target.parentElement
    get_id(data)
    get_variable(data)
    get_group(data)
    get_feature(data)

}

function get_id(data){
    id = data.querySelector('.table__body-id');
    set_id(id)
}
function set_id(id){
    idModal = document.getElementById('person-id')
    idModal.textContent = id.textContent
}
function get_variable(variable){
    variable = variable.querySelector('.table__body-prob');
    variable = variable.textContent;
    set_variable(variable);
}
function set_variable(variable){
    variable_modal = document.getElementById('person-variable')
    variable_modal.textContent = variable

}
function get_group(group){
    group = group.querySelector('.table__body-group');
    group = group.textContent;
    set_group(group)
}
function set_group(group){
    descriptionModal = document.getElementById('person-group');
    descriptionModal.textContent = group;
}
function get_feature(card){
    feature = card.querySelector('.table__body-feature');
    feature = feature.textContent;
    setTitleModal(feature)
}
function setTitleModal(feature){
    feature_modal = document.getElementById('person-feature')
    feature_modal.textContent = feature
}

function attachModalEvents(){
    modal.querySelector(".modal-person__content-back").addEventListener('click', closeModal)
    modal.querySelector(".modal__close").addEventListener('click', closeModal)
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
    modal.querySelector(".close").removeEventListener('click', closeModal)
    document.removeEventListener('keydown', handleEscape)
    modal.removeEventListener('click', handleClickCLose)
}
