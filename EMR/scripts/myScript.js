let intervalID; let timeoutID;
var comfirm_leave_page;

function formGroup_init() {
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
}

function checkboxRadiobutton_init() {
    let radiosAttr = [];

    document.querySelectorAll('input[type=radio]').forEach(e => {
        if (!radiosAttr.includes(e.name)) radiosAttr.push(e.name);
    });

    for (let i = 0; i < radiosAttr.length; i++) {
        let radiosEle = $(`input[name=${radiosAttr[i]}]`);

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
}

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
    } catch (ex) {
        console.error(ex);
    }
}

function changeValue(a, b) {
    document.getElementById(b).value = document.getElementById(a).innerHTML;
}

function changeValue1(a, b) {
    document.getElementById(b).value = a.innerHTML;
}

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

function InputFilter() {
    let temp = document.querySelectorAll('div[type="number"]');
    let temp1 = document.querySelectorAll('input[data-type="number"]');

    temp1.forEach(e => {
        setInputFilter(e, function (value) {
            //return /^[0-9\.\-\/]+$/.test(value);
            return /^\d*\.?\d*$/.test(value);
        });
    });
}

function CalculateBmi() {
    let vs_height = document.getElementById('txt_vs_height');
    let vs_weight = document.getElementById('txt_vs_weight');
    let vs_bmi = document.getElementById('txt_vs_bmi');
    console.log(vs_height, vs_weight, vs_bmi);
    if (vs_height.value == "" || vs_weight.value == "") {
        vs_bmi.value = "";
    }
    else {
        vs_bmi.value = (vs_weight.value / ((vs_height.value / 100) * 2)).toFixed(2);
    };
}

function radioButtonChange(eventArgs) {
    try {
        let EleByClassName;
        let disabledFor = eventArgs.getAttribute('disabled-for');

        if (disabledFor !== undefined && disabledFor !== null) {

            EleByClassName = document.getElementsByClassName(disabledFor);

            for (let l = 0; l < EleByClassName.length; l++) {
                EleByClassName[l].classList.remove("el-hide");
            }
        } else {

            EleByClassName = document.getElementsByClassName(eventArgs.getAttribute("data-target"));

            for (let l = 0; l < EleByClassName.length; l++) {
                EleByClassName[l].classList.add("el-hide");
            }
        }

    } catch (ex) {
        console.error(ex);
    }
}

Sys.Application.add_init(appl_init);

function appl_init() {
    var pgRegMgr = Sys.WebForms.PageRequestManager.getInstance();
    pgRegMgr.add_beginRequest(BeginHandler);
    pgRegMgr.add_endRequest(EndHandler);
}

function BeginHandler() {
    beforeAsyncPostBack();
}

function EndHandler() {
    afterAsyncPostBack();
}

function stayLoggedIn() {
    $("#PopupShowDelay").modal('hide');
}

function logout() {
    setTimeout("__doPostBack('stayLoggedIn', '')", 0);
}

function popupShowDelay(sessionTimeout) {

    clearInterval(intervalID);
    clearTimeout(timeoutID);

    timeoutID = setTimeout(() => {
        console.log('show delay');
        $('#PopupShowDelay').modal({ backdrop: 'static', keyboard: false });

        let _countDownTimer = 14;
        let _timeLeft = document.getElementById('timeleft');

        intervalID = setInterval(() => {
            _timeLeft.innerText = (_countDownTimer--);
            if (_countDownTimer < 0) { clearInterval(intervalID); logout(); }
        }, 1000);
    }, sessionTimeout * 60000 - 15000);
}

//function leaveEditFormEvent() {
//    window.addEventListener("beforeunload", function (e) {
//        var confirmationMessage = 'It looks like you have been editing something. '
//            + 'If you leave before saving, your changes will be lost.';
//        (e || window.event).returnValue = confirmationMessage; //Gecko + IE
//        console.log(confirmationMessage);

//        return confirmationMessage; //Gecko + Webkit, Safari, Chrome etc.
//    });
//}

function comfirm_leave_page(event) {
    let doc_id = sessionStorage.getItem('doc_id');
    let location = sessionStorage.getItem('location');
    let emp_id = sessionStorage.getItem('emp_id');
    let obj = JSON.parse(sessionStorage.getItem(doc_id));

    setTimeout(function () {
        setTimeout(function () {
            $.get('http://172.16.0.78:8088/api/emr/check-session/' + location + '/' + obj.document_id + '/' + emp_id, function (data) { console.log(data) });
        }, 2000);
    }, 1);

    console.log("leaving");

    $.ajax({
        url: 'http://172.16.0.78:8088/api/emr/clear-session/' + location + '/' + obj.document_id,
        type: 'POST',
        dataType: 'json',
        data: "{}",
        success: function (data, textStatus, xhr) {
            console.log(data);
        },
        error: function (xhr, textStatus, errorThrown) {
            console.log('Error in Operation');
        }
    });
    event.returnValue = '';
    return "You are leaving the page";
}

function editFormEvent(doc, location, emp_id) {
    console.log('doc', doc);
    let obj = JSON.parse(doc);
    window.sessionStorage.setItem('doc_id', obj.document_id);
    window.sessionStorage.setItem(obj.document_id, JSON.stringify(obj));
    window.sessionStorage.setItem('location', location);
    window.sessionStorage.setItem('emp_id', emp_id);

    window.addEventListener('beforeunload', comfirm_leave_page, true);

    console.log('comfirm_leave_page', comfirm_leave_page);
}

function ShowInfo(text) {
    swal({
        title: "Info",
        text: text,
        type: "info"
    });
}

function notification(text, type) {
    alertify.set({ delay: 1700 });
    switch (type) {
        case "success":
            alertify.success(text);
            break;
        case "info":
            alertify.log(text);
            break;
    }
    
}

//Auto Call
InputFilter();