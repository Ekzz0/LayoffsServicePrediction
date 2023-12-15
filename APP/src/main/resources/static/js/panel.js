const button_main = document.getElementById('main-panel')
button_main.addEventListener('click', handle_event)

const button_admin = document.getElementById('admin-panel')
button_admin.addEventListener('click', handle_event)

function handle_event(event){
    
    if (event.target == button_main){
        if (!button_main.classList.contains('active')){
            button_main.classList.toggle('active')
            button_admin.classList.toggle('active')
            toggle_panel()
        }
        
    }
    else{
        if (!button_admin.classList.contains('active')){
            button_main.classList.toggle('active')
            button_admin.classList.toggle('active')
            toggle_panel()
        }
    }
}
function toggle_panel(){
    document.getElementById('process-fit')
    .classList.toggle('hidden')
    document.getElementById('process-csv')
    .classList.toggle('hidden')
    document.getElementById('diagram-main')
    .classList.toggle('hidden')
    document.getElementById('table-admin')
    .classList.toggle('hidden')
    document.getElementById('table-main')
    .classList.toggle('hidden')
    

}

