//let customRadios = document.getElementsByClassName('custom-radio');

//for (let i = 0; i < customRadios.length; i++) {
    
//    let input = customRadios[i].getElementsByTagName('input')[0];
//    input.classList.add("custom-control-input");

//    let lable = customRadios[i].getElementsByTagName('label')[0];
//    lable.classList.add("custom-control-label");
//}

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

    for (let i = 0; i < radiosEle.length; i++) {

        //let attr = radiosEle[i].getAttribute('visible-for');

        let disabledFor = radiosEle[i].getAttribute('disabled-for');

        if (typeof disabledFor !== 'undefined' && disabledFor !== false) {

            if (radiosEle[i].checked) {
                let EleByClassName = document.getElementsByClassName(radiosEle[i].getAttribute('disabled-for'));

                for (let i = 0; i < EleByClassName.length; i++) {

                    //if (EleByClassName[i].classList.contains(disabledFor)) {
                    EleByClassName[i].disabled = false;
                    EleByClassName[i].contentEditable = true;
                    EleByClassName[i].style.display = "inline-block";
                    //} else {
                    //EleByClassName[i].disabled = true;
                    //EleByClassName[i].contentEditable = false;
                    //EleByClassName[i].style.display = "none";
                }
            } else {
                for (let i = 0; i < EleByClassName.length; i++) {
                    EleByClassName[i].disabled = true;
                    EleByClassName[i].contentEditable = false;
                    EleByClassName[i].style.display = "none";
                }
            }
        }

        //for (let i = 0; i < radiosEle.length; i++) {

        //    let EleByClassName = document.getElementsByClassName(radiosEle[i].getAttribute('disabled-for'));

        //    for (let i = 0; i < EleByClassName.length; i++) {

        //        if (EleByClassName[i].classList.contains(disabledFor)) {
        //            EleByClassName[i].disabled = false;
        //            EleByClassName[i].contentEditable = true;
        //            EleByClassName[i].style.display = "inline-block";
        //        } else {
        //            EleByClassName[i].disabled = true;
        //            EleByClassName[i].contentEditable = false;
        //            EleByClassName[i].style.display = "none";
        //        }
        //    }
        //}
    }
}


        if (typeof attr !== 'undefined' && attr !== false) {

            for (let i = 0; i < radiosEle.length; i++) {

                let EleByClassName = document.getElementsByClassName(radiosEle[i].getAttribute('visible-for'));

                console.log(EleByClassName);

                for (let i = 0; i < EleByClassName.length; i++) {
                    if (EleByClassName[i].classList.contains(attr)) {
                        EleByClassName[i].style.display = "flex";
                        console.log(EleByClassName[i]);
                    } else {
                        EleByClassName[i].style.display = "none";
                    }
                }
            }
        }


        radiosEle[i].addEventListener('change', function () {
            let attr = radiosEle[i].getAttribute('visible-for');

            let disabledFor = radiosEle[i].getAttribute('disabled-for');

            if (typeof disabledFor !== 'undefined' && disabledFor !== false) {

                for (let i = 0; i < radiosEle.length; i++) {

                    let EleByClassName = document.getElementsByClassName(radiosEle[i].getAttribute('disabled-for'));

                    for (let i = 0; i < EleByClassName.length; i++) {

                        if (EleByClassName[i].classList.contains(disabledFor)) {
                            EleByClassName[i].disabled = false;
                            EleByClassName[i].contentEditable = true;
                            EleByClassName[i].style.display = "inline-block";
                        } else {
                            EleByClassName[i].disabled = true;
                            EleByClassName[i].contentEditable = false;
                            EleByClassName[i].style.display = "none";
                        }
                    }
                }
            }

            if (typeof attr !== 'undefined' && attr !== false) {

                for (let i = 0; i < radiosEle.length; i++) {

                    let EleByClassName = document.getElementsByClassName(radiosEle[i].getAttribute('visible-for'));

                    console.log(EleByClassName);

                    for (let i = 0; i < EleByClassName.length; i++) {
                        if (EleByClassName[i].classList.contains(attr)) {
                            EleByClassName[i].style.display = "flex";
                            console.log(EleByClassName[i]);
                        } else {
                            EleByClassName[i].style.display = "none";
                        }
                    }
                }
            }
        })
    }
}

