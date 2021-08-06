
    let fall_history_score = 0;
    let secon_diagnosis_score = 0;
    let ambula_aids_score = 0;
    let intra_therapy_score = 0;
    let gait_trans_score = 0;
    let fr_mental_status_score = 0;

    let nutrition_score1 = 0;
    let nutrition_score2 = 0;
    let nutrition_score3 = 0;
    let nutrition_score_total = 0;

    let severity_score1 = 0;
    let severity_score2 = 0;
    let severity_score3 = 0;
    let severity_score_total = 0;

    let age_score1 = 0;
    let age_score_total = 0;

        (function initial() {
            if (document.getElementById('rad_fall_history_code_0').checked) {fall_history_score = 0; }
            else if (document.getElementById('rad_fall_history_code_25').checked) {fall_history_score = 25; }

            if (document.getElementById('rad_secon_diagnosis_code_0').checked) {secon_diagnosis_score = 0; }
            else if (document.getElementById('rad_secon_diagnosis_code_15').checked) {secon_diagnosis_score = 15; }

            if (document.getElementById('rad_ambula_aids_code_30').checked) {ambula_aids_score = 30; }
            else if (document.getElementById('rad_ambula_aids_code_15').checked) {ambula_aids_score = 15; }
            else if (document.getElementById('rad_ambula_aids_code_0').checked) {ambula_aids_score = 0; }

            if (document.getElementById('rad_intra_therapy_code_20').checked) {intra_therapy_score = 20; }
            else if (document.getElementById('rad_intra_therapy_code_0').checked) {intra_therapy_score = 0; }

            if (document.getElementById('rad_gait_trans_code_20').checked) {gait_trans_score = 20; }
            else if (document.getElementById('rad_gait_trans_code_10').checked) {gait_trans_score = 10; }
            else if (document.getElementById('rad_gait_trans_code_20').checked) {gait_trans_score = 0; }

            if (document.getElementById('rad_fr_mental_status_code_15').checked) {fr_mental_status_score = 15; }
            else if (document.getElementById('rad_fr_mental_status_code_0').checked) {fr_mental_status_score = 0; }

            updateFrTotalScore();
        }());

        // History of falling
        document.querySelector('#rad_fall_history_code_0').addEventListener("change", () => {fall_history_score = 0; updateFrTotalScore(); });

        document.querySelector('#rad_fall_history_code_25').addEventListener("change", () => {fall_history_score = 25; updateFrTotalScore(); });
        //Secondary diagnosis
        document.querySelector('#rad_secon_diagnosis_code_0').addEventListener("change", () => {secon_diagnosis_score = 0; updateFrTotalScore(); });

        document.querySelector('#rad_secon_diagnosis_code_15').addEventListener("change", () => {secon_diagnosis_score = 15; updateFrTotalScore(); });
        //Ambulatory Aids
        document.querySelector('#rad_ambula_aids_code_30').addEventListener("change", () => {ambula_aids_score = 30; updateFrTotalScore(); });

        document.querySelector('#rad_ambula_aids_code_15').addEventListener("change", () => {ambula_aids_score = 15; updateFrTotalScore(); });

        document.querySelector('#rad_ambula_aids_code_0').addEventListener("change", () => {ambula_aids_score = 0; updateFrTotalScore(); });
        //Intravenous therapy/heparin locked
        document.querySelector('#rad_intra_therapy_code_20').addEventListener("change", () => {intra_therapy_score = 20; updateFrTotalScore(); });

        document.querySelector('#rad_intra_therapy_code_0').addEventListener("change", () => {intra_therapy_score = 0; updateFrTotalScore(); });
        //Gait/ transferring
        document.querySelector('#rad_gait_trans_code_20').addEventListener("change", () => {gait_trans_score = 20; updateFrTotalScore(); });

        document.querySelector('#rad_gait_trans_code_10').addEventListener("change", () => {gait_trans_score = 10; updateFrTotalScore(); });

        document.querySelector('#rad_gait_trans_code_0').addEventListener("change", () => {gait_trans_score = 0; updateFrTotalScore(); });
        //Mental status
        document.querySelector('#rad_fr_mental_status_code_15').addEventListener("change", () => {fr_mental_status_score = 15; updateFrTotalScore(); });

        document.querySelector('#rad_fr_mental_status_code_0').addEventListener("change", () => {fr_mental_status_score = 0; updateFrTotalScore(); });

        function updateFrTotalScore() {

        //document.querySelector("#lbl_fr_total_score").value = fall_history_score + secon_diagnosis_score + ambula_aids_score + intra_therapy_score + gait_trans_score + fr_mental_status_score;

            document.querySelector("#txt_fr_total_score").value = fall_history_score + secon_diagnosis_score + ambula_aids_score + intra_therapy_score + gait_trans_score + fr_mental_status_score;
        }


        (function temp() {
        nutrition_score1Change();
            nutrition_score2Change();
            nutrition_score3Change();

        }());

        function nutrition_score1Change() {
        nutrition_score1 = 0;
            let checkbox1 = document.getElementById("cb_nutrition_score1_1");
            let checkbox2 = document.getElementById("cb_nutrition_score1_2");

            if (checkbox1.checked || checkbox2.checked) {
        nutrition_score1 = 1;
            }

            updateNutritionScore();
        }

        function nutrition_score2Change() {
        nutrition_score2 = 0;

            let checkbox1 = document.getElementById("cb_nutrition_score2_1");
            let checkbox2 = document.getElementById("cb_nutrition_score2_2");
            let checkbox3 = document.getElementById("cb_nutrition_score2_3");

            if (checkbox1.checked || checkbox2.checked || checkbox3.checked) {
        nutrition_score2 = 2;
            }

            updateNutritionScore();
        }

        function nutrition_score3Change() {
        nutrition_score3 = 0;

            let checkbox1 = document.getElementById("cb_nutrition_score3_1");
            let checkbox2 = document.getElementById("cb_nutrition_score3_2");
            let checkbox3 = document.getElementById("cb_nutrition_score3_3");

            if (checkbox1.checked || checkbox2.checked || checkbox3.checked) {
        nutrition_score3 = 3;
            }

            updateNutritionScore();
        }

        function updateNutritionScore() {
        nutrition_score_total = parseInt(nutrition_score1) + parseInt(nutrition_score2) + parseInt(nutrition_score3);
            document.getElementById("lbl_nutrition_score").innerText = nutrition_score_total;

            updateTotalNutriScore();
        }


        // Severity of disease

        function severity_score1Change() {
        severity_score1 = 0;
            let checkbox1 = document.getElementById("cb_severity_score1_1");
            let checkbox2 = document.getElementById("cb_severity_score1_2");
            let checkbox3 = document.getElementById("cb_severity_score1_3");
            let checkbox4 = document.getElementById("cb_severity_score1_4");

            if (checkbox1.checked || checkbox2.checked || checkbox3.checked || checkbox4.checked) {
        severity_score1 = 1;
            }

            updateSeverityScore();
        }

        function severity_score2Change() {
        severity_score2 = 0;
            let checkbox1 = document.getElementById("cb_severity_score2_1");
            let checkbox2 = document.getElementById("cb_severity_score2_2");
            let checkbox3 = document.getElementById("cb_severity_score2_3");
            let checkbox4 = document.getElementById("cb_severity_score2_4");
            let checkbox5 = document.getElementById("cb_severity_score2_5");

            if (checkbox1.checked || checkbox2.checked || checkbox3.checked || checkbox4.checked || checkbox5.checked) {
        severity_score2 = 2;
            }

            updateSeverityScore();
        }

        function severity_score3Change() {
        severity_score3 = 0;
            let checkbox1 = document.getElementById("cb_severity_score3_1");
            let checkbox2 = document.getElementById("cb_severity_score3_2");
            let checkbox3 = document.getElementById("cb_severity_score3_3");

            if (checkbox1.checked || checkbox2.checked || checkbox3.checked) {
        severity_score3 = 3;
            }

            updateSeverityScore();
        }



        function updateSeverityScore() {
        severity_score_total = parseInt(severity_score1) + parseInt(severity_score2) + parseInt(severity_score3);
            document.getElementById("lbl_severity_score").innerText = severity_score_total;

            updateTotalNutriScore();
        }

        function age_score1Change() {
        age_score = 0;
            let checkbox1 = document.getElementById("cb_older_70_True");

            if (checkbox1.checked) {
        age_score1 = 1;
            }

            updateAgeScore();
        }

        function updateAgeScore() {
        age_score_total = parseInt(age_score1);
            document.getElementById("lbl_age_score").innerText = age_score_total;
            updateTotalNutriScore();
        }

        function updateTotalNutriScore() {
        document.getElementById("lbl_total_nutri_score").innerText = nutrition_score_total + severity_score_total + age_score_total;
        }

        let clear_fall_history_score = (el) => {
        clearRadioButton(el);
            fall_history_score = 0;
            updateFrTotalScore();
        }

        let clear_secon_diagnosis_score = (el) => {
        clearRadioButton(el);
            secon_diagnosis_score = 0;
            updateFrTotalScore();
        }

        let clear_ambula_aids_score = (el) => {
        clearRadioButton(el);
            ambula_aids_score = 0;
            updateFrTotalScore();
        }

        let clear_intra_therapy_score = (el) => {
        clearRadioButton(el);
            intra_therapy_score = 0;
            updateFrTotalScore();
        }

        let clear_gait_trans_score = (el) => {
        clearRadioButton(el);
            gait_trans_score = 0;
            updateFrTotalScore();
        }

        let clear_fr_mental_status_score = (el) => {
        clearRadioButton(el);
            clear_fr_mental_status_score = 0;
            updateFrTotalScore();
        }

        function clearRadioButton(el) {
        let radioButton = document.querySelector(`input[name="${el.getAttribute("data-clear")}"]:checked`);
            if (radioButton) {radioButton.checked = false; }
        }

        let sensory_score, moisture_score, activity_score, mobility_score, nutrition_score, friction_score;
        let total_score = document.getElementById("lbl_total_score")

        let update_total_score = () => {
            if (!sensory_score || !moisture_score || !activity_score || !mobility_score || !nutrition_score || !friction_score) {
        lbl_total_score.innerText = "—";
            } else {
        lbl_total_score.innerText = parseInt(sensory_score) + parseInt(moisture_score) + parseInt(activity_score) + parseInt(mobility_score) + parseInt(nutrition_score) + parseInt(friction_score);
            }
        }

        let sensory_score_change = (e) => {sensory_score = e.value; update_total_score(); }

        let moisture_score_change = (e) => {moisture_score = e.value; update_total_score(); }

        let activity_score_change = (e) => {activity_score = e.value; update_total_score(); }

        let mobility_score_change = (e) => {mobility_score = e.value; update_total_score(); }

        let nutrition_score_change = (e) => {nutrition_score = e.value; update_total_score(); }

        let friction_score_change = (e) => {friction_score = e.value; update_total_score(); }

        //
        let bmi_out_range = document.getElementById("rad_bmi_out_range_True");
        let severely_ill = document.getElementById("rad_severely_ill_True");
        let reduce_dietary = document.getElementById("rad_reduce_dietary_True");
        let loss_weight = document.getElementById("rad_loss_weight_True");

        function initial_screening_change() {
            let final_screening = document.querySelector(".final_screening");
            if (bmi_out_range.checked || severely_ill.checked || reduce_dietary.checked || loss_weight.checked) {
        final_screening.classList.remove("el-hide");
            } else {
        final_screening.classList.add("el-hide");
            }
        }

        //
        if (document.querySelector("#RequiredFieldValidator").value) {
        let errors = document.querySelector("#RequiredFieldValidator").value

            (errors);

            if (errors.includes("pro_cough_error")) {
        document.querySelector("#pro_cough_error").innerHTML = "this field is required.";
            }

            if (errors.includes("last_date_changed_error")) {
        let last_date_changed_error = document.getElementById("last_date_changed_error");
                if (last_date_changed_error) last_date_changed_error.innerHTML = "Ngày thay gần nhất/ Fr, Date last changed is required";
            }

            if (errors.includes("last_sup_catheter_date_error")) {
        let last_date_changed_error = document.getElementById("last_sup_catheter_date_error");
                if (last_date_changed_error) last_date_changed_error.innerHTML = "Ngày thay gần nhất/ Fr, Date last changed is required";
            }


            if (errors.includes("other_hospital_error")) {
        let other_hospital_error = document.getElementById("other_hospital_error"); if (other_hospital_error) other_hospital_error.innerHTML = "Yêu cầu chuyển đến bệnh viện khác/ Requires referral to other hospital";
            }

            if (errors.includes("assess_date_time_error")) {
        let assess_date_time_error = document.getElementById("assess_date_time_error");
                if (assess_date_time_error) assess_date_time_error.innerHTML = "Ngày giờ/ Date & Time is required";
            }

            if (errors.includes("ind_catheter_error")) {
        let ind_catheter_error = document.getElementById("ind_catheter_error");
                if (ind_catheter_error) ind_catheter_error.innerHTML = "Ngày giờ/ Date & Time is required";
            }

            if (errors.includes("ind_catheter_date_error")) {
        let ind_catheter_date_error = document.getElementById("ind_catheter_date_error");
                if (ind_catheter_date_error) ind_catheter_date_error.innerHTML = "Ngày giờ/ Date & Time is required";
            }


        }