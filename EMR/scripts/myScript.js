
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
});

for (let i = 0; i < radiosAttr.length; i++) {
    let radiosEle = $(`input[name=${radiosAttr[i]}]`);

    let isChecked = false;

    for (let j = 0; j < radiosEle.length; j++) {
        let disabledFor = radiosEle[j].getAttribute('disabled-for');

        if (disabledFor != 'undefined' && disabledFor != false) {

            if (!radiosEle[j].checked) {
                let EleByClassName = document.getElementsByClassName(disabledFor);

                for (let l = 0; l < EleByClassName.length; l++) {
                    EleByClassName[l].classList.add("el-hide");
                }
            }
        }

        radiosEle[j].addEventListener('change', function () {
            try {

                if (document.querySelector(`[data-clear="${radiosEle[j].getAttribute('name')}"]`)) {
                    document.querySelector(`[data-clear="${radiosEle[j].getAttribute('name')}"]`).classList.remove("el-hide");
                }

                let disabledFor = radiosEle[j].getAttribute('disabled-for');

                if (disabledFor != 'undefined' && disabledFor != false) {

                    for (let k = 0; k < radiosEle.length; k++) {

                        let EleByClassName = document.getElementsByClassName(radiosEle[k].getAttribute('disabled-for'));

                        for (let l = 0; l < EleByClassName.length; l++) {

                            if (EleByClassName[l].classList.contains(disabledFor)) {
                                EleByClassName[l].classList.remove("el-hide");
                                EleByClassName[l].classList.add("el-show");
                            } else {
                                EleByClassName[l].classList.remove("el-show");
                                EleByClassName[l].classList.add("el-hide");
                            }
                        }
                    }
                }
            } catch (ex) {
                console.error(ex);
            }
        })
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
    try {

        let radioButton =  document.querySelector(`input[name="${el.getAttribute("data-clear")}"]:checked`);

        radioButton.checked = false;

        let disabledFor = radioButton.getAttribute('disabled-for');

        if (disabledFor !== 'undefined' && disabledFor !== false && disabledFor !== null) {
            let EleByClassName = document.getElementsByClassName(disabledFor);

            for (let k = 0; k < EleByClassName.length; k++) {
                EleByClassName[k].classList.remove("el-show");
                EleByClassName[k].classList.add("el-hide");
            }
        }

        el.classList.add("el-hide");
    } catch (ex) {
        console.error(ex);
    }
}

function changeValue(a, b) {
    document.getElementById(b).value = document.getElementById(a).innerHTML;
}

//
function setInputFilter(textbox, inputFilter) {
    ["input", "keydown", "keyup", "mousedown", "mouseup", "select", "contextmenu", "drop"].forEach(function (event) {
        textbox.addEventListener(event, function () {
            if (inputFilter(this.value)) {
                this.oldValue = this.value;
                this.oldSelectionStart = this.selectionStart;
                this.oldSelectionEnd = this.selectionEnd;
            } else if (this.hasOwnProperty("oldValue")) {
                this.value = this.oldValue;
                this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
            } else {
                this.value = "";
            }
        });
    });
}

        //function setInputFilter(textbox, inputFilter) {
        //    ["input", "keydown", "keyup", "mousedown", "mouseup", "select", "contextmenu", "drop"].forEach(function (event) {
        //        textbox.addEventListener(event, function () {
        //            if (inputFilter(this.innerText)) {
        //                this.oldValue = this.innerHTML;
        //                this.oldSelectionStart = this.selectionStart;
        //                this.oldSelectionEnd = this.selectionEnd;
        //            } else if (this.hasOwnProperty("oldValue")) {
        //                this.innerHTML = this.oldValue;

        //                this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
        //            } else {
        //                this.innerHTML = "";
        //            }
        //        });
        //    });
        //}
let temp = document.querySelectorAll('div[type="number"]');
let temp1 = document.querySelectorAll('input[data-type="number"]');

temp1.forEach(e => {
    setInputFilter(e, function (value) {
        return /^\d*\.?\d*$/.test(value);
    });
})