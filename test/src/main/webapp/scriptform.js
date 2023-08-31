const form = document.querySelector("form"),
    Nextpage= form.querySelector(".Nextpage"),
    Backpage= form.querySelector(".Backpage"),
    allInput= form.querySelectorAll(".pierwszy input");


Nextpage.addEventListener("click", ()=> {
    allInput.forEach(input => {
        if(input.value != ""){
            form.classList.add('secActive');
        }
        else {
            form.classList.remove('secActive');
            alert("pusty wpis!")
        }
    })
})

Backpage.addEventListener("click", ()=>  form.classList.remove('secActive'));