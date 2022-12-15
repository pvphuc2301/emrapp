function ImageEditor(data_base64) {
    const canvas = document.querySelector('#canvas');
    const histories = document.querySelector('#histories');
    const ctx = canvas.getContext("2d");
    canvas.height = 500;
    canvas.width = 500;
    ctx.strokeStyle = "red";
    //let imageTemp = document.getElementById("image1");

    let img1 = new Image();

    img1.onload = function () {
        ctx.drawImage(img1, 0, 0);
    }

    img1.src = document.getElementById("hair_removal_diagram_data_base64").value;

    let painting = false;
    let pen = false;

    var history = {
        redo_list: [],
        undo_list: [],
        saveState: function (canvas, list, keep_redo) {
            keep_redo = keep_redo || false;
            if (!keep_redo) {
                this.redo_list = [];
            }

            (list || this.undo_list).push(canvas.toDataURL());
        },
        undo: function (canvas, ctx) {
            this.restoreState(canvas, ctx, this.undo_list, this.redo_list);
        },
        redo: function (canvas, ctx) {
            this.restoreState(canvas, ctx, this.redo_list, this.undo_list);
        },
        restoreState: function (canvas, ctx, pop, push) {
            if (pop.length) {
                this.saveState(canvas, push, true);
                var restore_state = pop.pop();
                var img = document.createElement("img");
                img.src = restore_state;

                img.onload = function () {
                    ctx.clearRect(0, 0, canvas.width, 400);
                    ctx.drawImage(img, 0, 0, canvas.width, canvas.height, 0, 0, canvas.width, canvas.height);
                }
            }
        }
    }

    var pencil = {
        options: {
            stroke_color: "red",
            dim: 4
        },
        init: function (canvas, ctx) {
            this.canvas = canvas;
            this.ctx = ctx;
            this.ctx.strokeColor = this.options.stroke_color;
            this.drawing = false;
            this.addCanvasEvents();
        },
        addCanvasEvents: function () {
            this.canvas.addEventListener('mousedown', this.start.bind(this));
            this.canvas.addEventListener('mousemove', this.stroke.bind(this));
            this.canvas.addEventListener('mouseup', this.stop.bind(this));
            this.canvas.addEventListener('mouseout', this.stop.bind(this));
        },
        start: function (e) {
            if (currentAct != act.PEN) return;
            this.ctx.beginPath();
            history.saveState(this.canvas);
            this.drawing = true;
        },
        stroke: function (e) {
            if (currentAct != act.PEN) return;

            if (this.drawing) {
                let rect = canvas.getBoundingClientRect();

                var x = e.clientX - rect.left;
                var y = e.clientY - rect.top;

                this.ctx.lineTo(x, y);
                this.ctx.stroke(); // draw line
                this.ctx.beginPath();
                this.ctx.moveTo(x, y);
            }
        },
        stop: function (e) {
            if (currentAct != act.PEN) return;

            if (this.drawing) {
                this.drawing = false;
                this.ctx.beginPath();
            }
            var image = document.getElementById("canvas").toDataURL("image/png");

            document.getElementById(data_base64).value = image;
        }
    };

    let note = {
        options: {},
        init: function (canvas, ctx) {
            this.canvas = canvas;
            this.ctx = ctx;
            this.addCanvasEvents();
        },
        addCanvasEvents: function () {
            this.canvas.addEventListener('mousedown', this.start.bind(this));
            //this.canvas.addEventListener('mousemove', this.stroke.bind(this));
            this.canvas.addEventListener('mouseup', this.stop.bind(this));
            this.canvas.addEventListener('mouseout', this.stop.bind(this));
        },
        start: function (e) {
            if (currentAct != act.NOTE) return;
            history.saveState(this.canvas);

            let rect = canvas.getBoundingClientRect();

            var x = e.clientX - rect.left;
            var y = e.clientY - rect.top;

            ctx.beginPath();
            ctx.moveTo(x, y);
            ctx.lineTo(x + 20, y);
            ctx.lineTo(x + 20, y + 25);
            ctx.lineTo(x + 10, y + 30);
            ctx.lineTo(x, y + 25);
            ctx.lineTo(x, y);
            ctx.fillStyle = "blue";

            ctx.font = "13px Verdana";
            ctx.fillText("1", x + 6, y + 18);
            ctx.stroke();
        },
        stop: function (e) {
            if (currentAct != act.NOTE) return;
            this.ctx.beginPath();

            let his = JSON.stringify(history);

            let img = document.getElementById("image1");

            img.src = this.canvas;

            //$.ajax({
            //    type: 'POST',
            //    url: "Paint.aspx/updateImage",
            //    data: JSON.stringify(history),
            //    contentType: 'application/json; charset=utf-8',
            //    dataType: 'json',
            //    success: function () {
            //        console.log('done');
            //        swal("Done!", "It was succesfully deleted!", "success");
            //    },
            //    error: function (xhr, ajaxOptions, thrownError) {
            //        swal("Error deleting!", "Please try again", "error");
            //    }
            //});

            //$.ajax({
            //    type: 'POST',
            //    url: "Paint.aspx/updateImage",
            //    data: JSON.stringify(history),
            //    contentType: 'application/json; charset=utf-8',
            //    dataType: 'json',
            //    success: function (msg) {
            //        console.log(msg);
            //    }
            //});
        }
    }

    const act = { PEN: 1, NOTE: 2 };
    Object.freeze(act);

    let currentAct;

    $('#note').click(function () {
        currentAct = act.NOTE;
        note.init(canvas, ctx);
    });

    $('#pencil').click(function () {
        currentAct = act.PEN;
        pencil.init(canvas, ctx);
    });

    $('#undo').click(function () {
        history.undo(canvas, ctx);
    });

    $('#redo').click(function () {
        history.redo(canvas, ctx);
    });

};