let formGroup = document.getElementsByClassName('form-group');

for (let i = 0; i < formGroup.length; i++) {

    let input = formGroup[i].getElementsByTagName('input');
    let prepend = formGroup[i].getElementsByClassName('prepend');
    let append = formGroup[i].getElementsByClassName('append');

    if (prepend.length != 0) {
        prepend[0].style.position = "sticky";
        input[0].style.marginLeft = "-" + (append[0].offsetWidth + 20) + "px";
    }

    if (append.length != 0) {
        append[0].style.position = 'relative';
        append[0].style.marginLeft = "-" + (append[0].offsetWidth + 20) + "px";
        input[0].style.paddingRight = (append[0].offsetWidth + 25) + "px";
    }
}

//Radio button
let radios = $("input[type=radio]");

let radiosAttr = [];

for (let i = 0; i < radios.length; i++) {
    radiosAttr.push(radios[i].name);
}

var radiosUnique = radiosAttr.filter((v, i, a) => a.indexOf(v) === i);

for (let i = 0; i < radiosUnique.length; i++) {
    let radiosEle = $(`input[name=${radiosUnique[i]}]`);

    for (let j = 0; j < radiosEle.length; j++) {
        let disabledFor = radiosEle[j].getAttribute('disabled-for');

        if (disabledFor !== 'undefined' && disabledFor !== false && disabledFor !== null) {
            let EleByClassName = document.getElementsByClassName(radiosEle[j].getAttribute('disabled-for'));

            for (let k = 0; k < EleByClassName.length; k++) {
                
                if (radiosEle[j].getAttribute('checked')) {
                    EleByClassName[k].style.display = "";
                } else {
                    EleByClassName[k].style.display = "none";
                }
            }
        }

        radiosEle[j].addEventListener('change', function () {
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
}

