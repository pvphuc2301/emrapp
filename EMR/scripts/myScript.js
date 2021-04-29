
document.querySelectorAll('.form-group').forEach(e => {
    let input = e.getElementsByTagName('input');
    let prepend = e.getElementsByClassName('prepend');
    let append = e.getElementsByClassName('append');

    if (prepend.length != 0) {
        prepend[0].style.position = "sticky";
        input[0].style.marginLeft = "-" + (append[0].offsetWidth + 20) + "px";
    }

    if (append.length != 0) {
        append[0].style.position = 'relative';
        append[0].style.marginLeft = "-" + (append[0].offsetWidth + 20) + "px";
        input[0].style.paddingRight = (append[0].offsetWidth + 25) + "px";
    }
});

//Radio button

let radiosAttr = [];

document.querySelectorAll('input[type=radio]').forEach(e => {
    if (!radiosAttr.includes(e.name)) radiosAttr.push(e.name);
})

for (let i = 0; i < radiosAttr.length; i++) {
    let radiosEle = $(`input[name=${radiosAttr[i]}]`);

    let isChecked = false;

    for (let j = 0; j < radiosEle.length; j++) {
        let disabledFor = radiosEle[j].getAttribute('disabled-for');

        if (disabledFor !== 'undefined' && disabledFor !== false && disabledFor !== null) {
            let EleByClassName = document.getElementsByClassName(radiosEle[j].getAttribute('disabled-for'));

            for (let k = 0; k < EleByClassName.length; k++) {

                if (radiosEle[j].getAttribute('checked')) {
                    isChecked = true;
                    EleByClassName[k].style.display = "";
                } else {
                    EleByClassName[k].style.display = "none";
                }
            }
        }

        radiosEle[j].addEventListener('change', function () {

            document.querySelector(`[data-clear="${radiosEle[j].getAttribute('name')}"]`).style.display = "";

            let disabledFor = radiosEle[j].getAttribute('disabled-for');

            if (disabledFor !== 'undefined' && disabledFor !== false) {

                for (let k = 0; k < radiosEle.length; k++) {

                    let EleByClassName = document.getElementsByClassName(radiosEle[k].getAttribute('disabled-for'));

                    for (let l = 0; l < EleByClassName.length; l++) {

                        if (EleByClassName[l].classList.contains(disabledFor)) {
                            EleByClassName[l].style.display = "";
                        } else {
                            EleByClassName[l].style.display = "none";
                        }
                    }
                }
            }

        })
    }

    if (isChecked) {
        console.log(radiosEle[radiosEle.length - 1]);
    }
}

//Checkbox
let cbs = document.querySelectorAll('input[type=checkbox]');

cbs.forEach((cb) => {
    let disabledFor = cb.getAttribute('disabled-for');

    if (disabledFor !== 'undefined' && disabledFor !== false && disabledFor !== null) {

        let EleByClassName = document.querySelectorAll(`.${cb.getAttribute('disabled-for')}`);

        if (cb.checked) {
            EleByClassName.forEach(e => e.style.display = "");
        } else {
            EleByClassName.forEach(e => e.style.display = "none");
        }

        cb.addEventListener('change', function () {
            if (cb.checked) {
                EleByClassName.forEach(e => e.style.display = "");
            } else {
                EleByClassName.forEach(e => e.style.display = "none");
            }
        })
    }
})

function clear_radiobutton(el) {
    document.querySelector('input[name="rad_cde_after_discharge"]:checked').checked = false;
    el.style.display = 'none';
}