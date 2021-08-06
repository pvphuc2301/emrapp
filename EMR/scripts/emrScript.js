
function formatDate(_date) {
    date = new Date(_date);
    return date.getDate() + "-" + (date.getMonth() + 1) + "-" + date.getFullYear()
}

function loadModal(modalId, docId) {
    $.ajax({
        url: "http://172.16.0.78:8082/api/emr/get-api/" + modalId
    }).done(function (data) {

        if (data.model_name == "OUTPATIENT MEDICAL RECORD") {
            loadForm("OutpatientMedicalRecord.aspx?docId=" + docId);
        }
    });
}

function loadDocumentList(patientsDocument, pid, callback) {
    $.ajax({
        url: "http://172.16.0.78:8082/api/emr/menu-visit-form/" + pid
    }).done(function (data) {
        for (let i = 0; i < data.length; i++) {
            if (data[i].documents.length > 0) {

                let item = document.createElement("li");
                itemTitle = document.createElement("a");
                itemTitle.classList.add("sidebar-dropdown-toggle");
                itemTitle.href = "javascript:void(0)";
                itemTitle.innerText = `${formatDate(data[i].actual_visit_date_time)} (${data[i].visit_type}-${data[i].visit_code})`;

                item.append(itemTitle);
                item.classList.add("sidebar-dropdown");

                let doc = document.createElement("ul");
                doc.classList.add("sidebar-submenu", "sidebar-submenu-test");

                for (let j = 0; j < data[i].documents.length; j++) {

                    let docItem = document.createElement("li");
                    docItem.classList.add("submenu-item", "ml-0", "pl-0");
                    let itemLink = document.createElement("a");
                    itemLink.href = "javascript:void(0)";
                    itemLink.addEventListener("click", function () {
                        loadForm(data[i].documents[j].url);
                        //loadModal(data[i].documents[j].model_id, data[i].documents[j].document_id);
                    });
                    itemLink.setAttribute("data-toggle", "popover");
                    itemLink.setAttribute("data-html", "true");
                    itemLink.setAttribute("data-trigger", "hover");
                    itemLink.style.overflow = "hidden";
                    itemLink.style.width = "max-content";

                    //
                    let titleContent = `
                            <table style="width: max-content">
                                <tr>
                                    <td width="100">Category</td>
                                    <td>${ formatDate(data[i].actual_visit_date_time)} (${data[i].visit_type}-${data[i].visit_code })</td>
                                </tr>
<tr>
                                    <td>Author</td>
                                    <td>${ data[i].documents[j].created_name_l }</td>
                                </tr>
<tr>
                                    <td>Visit</td>
                                    <td>${ data[i].visit_type}-${data[i].visit_code} (${formatDate(data[i].actual_visit_date_time)}) </td>
                                </tr>
                            </table>`

                    itemLink.setAttribute("title", `${data[i].documents[j].status}_${data[i].documents[j].model_name}`);
                    itemLink.setAttribute("data-content", titleContent);
                    itemLink.setAttribute("data-placement", "bottom");
                    

                    //

                    itemLink.innerHTML = `${data[i].documents[j].status}_${data[i].documents[j].model_name} <span class='badge badge-pill badge-secondary'>${data[i].documents[j].created_name_l}</span>`;

                    docItem.append(itemLink);

                    doc.append(docItem);

                    item.append(doc);
                }

                patientsDocument.append(item);
            }
        }

        callback();
    });
}

function loadPID() {
    
    let pid = localStorage.getItem('pid');
    let iframe = parent.parent.document.getElementById('formFrame');

    

    if (!iframe) {
        

        iframe = document.createElement("iframe");

        document.getElementById("form1").append(iframe);
    }

    if (pid) {
        iframe.src = "emr/Emr.aspx";
        $(".page-wrapper1").removeClass("toggled");
    }
    else {
        iframe.src = "Dashboard.aspx";
        $(".page-wrapper1").addClass("toggled");
    }
}

function closePID() {
    localStorage.removeItem('pid');
    window.location = "http://localhost:4200/Dashboard.aspx";
    
    
}

function openPID(pid) {
    localStorage.setItem('pid', pid);
    window.location = "http://localhost:4200/emr/Emr.aspx";

}

function addListPID() {
    let item = document.createElement('a');
    item.classList.add('list-group-item');
    item.innerHTML = '900000488';
}

function addOptionToSelect() {

    for (let i = 0; i < 2; i++) {
        let item = document.createElement('a');
        item.classList.add('list-group-item');
        item.innerHTML = '900000488';
    }

    document.getElementById("exampleModal").modal();
    
}