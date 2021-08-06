if (document.querySelector("#RequiredFieldValidator")) {
    if (document.querySelector("#RequiredFieldValidator").value) {
        let stringError = document.querySelector("#RequiredFieldValidator").value;
        let errors = stringError.substr(0, stringError.length - 1).split(' ');
        
        for (let i = 0; i < errors.length; i++) {
            
            document.getElementById(String(errors[i])).classList.remove("el-hide");
        }
    }
}