<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Paint.aspx.cs" Inherits="EMR.Paint" %>

<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="aih" TagName="TextField" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../styles/sweetalert.min.css" rel="stylesheet" />
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        #canvas {
            border: 2px solid #000;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <img id="image1" runat="server" onload="image1_Load" style="display: none;" />

        <div style="width: 500px;">
            <div id="controllers">
                <span class="controller btn btn-secondary" id="undo">undo</span>
                <span class="controller btn btn-secondary" id="redo">redo</span>
                <div class=" btn btn-secondary">
                    <svg id="pencil" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                        <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z" />
                    </svg>
                </div>
                <span class="controller btn btn-secondary" id="note">note</span>
            </div>
            <canvas id="canvas" runat="server"></canvas>
            <div>
                <div style="display: flex; align-items: center;">
                    2
                    <aih:TextField runat="server" ID="TextField1" />
                    <div class="btn btn-outline-secondary ml-1">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                            <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z" />
                            <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z" />
                        </svg>
                    </div>
                </div>
            </div>
        </div>



        <asp:Button Text="Complete" ID="btnComplete" OnClick="btnComplete_Click" runat="server" />
        <div id="Div1" runat="server" onclick="comfirmDelete()" class="btn btn-danger waves-effect">Delete</div>
        
        <div runat="server" id="histories"></div>

        <div id="container2">
            <canvas id="canvas2" width="400" height="300">This text is displayed if your browser does not support HTML5 Canvas.
            </canvas>
        </div>

        <script src="../../scripts/jquery-3.2.1.min.js"></script>
        <script>
            function comfirmDelete() {
                $.ajax({
                    type: 'POST',
                    url: "Paint.aspx/GetImage",
                    data: '{ "imageData" : "' + "sdfs" + '" }',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function () {
                        swal("Done!", "It was succesfully deleted!", "success");
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        swal("Error deleting!", "Please try again", "error");
                    }
                });
                //$.ajax({
                //    type: 'POST',
                //    url: "Paint.aspx/GetImage",
                //    data: '{ "imageData" : "' + "sdfs" + '" }',
                //    contentType: 'application/json; charset=utf-8',
                //    dataType: 'json',
                //    success: function (msg) {
                //        console.log(msg);
                //    }
                //});
            }
                //swal({
                //    title: "Are you sure?",
                //    text: "You will not be able to recover this imaginary file!",
                //    type: "warning",
                //    showCancelButton: true,
                //    confirmButtonColor: "#DD6B55",
                //    confirmButtonText: "Yes, delete it!",
                //    closeOnConfirm: false
                //}, function (isConfirm) {
                //    if (!isConfirm) return;
                //    $.ajax({
                //        type: 'POST',
                //        url: "Paint.aspx/updateImage",
                //        data: JSON.stringify(history),
                //        contentType: 'application/json; charset=utf-8',
                //        dataType: 'json',
                //        success: function () {
                //            console.log('done');
                //            swal("Done!", "It was succesfully deleted!", "success");
                //        },
                //        error: function (xhr, ajaxOptions, thrownError) {
                //            swal("Error deleting!", "Please try again", "error");
                //        }
                //    });
            //    });
            //}
            // Last updated November 2010 by Simon Sarris
            // www.simonsarris.com
            // sarris@acm.org
            //
            // Free to use and distribute at will
            // So long as you are nice to people, etc

            // This is a self-executing function that I added only to stop this
            // new script from interfering with the old one. It's a good idea in general, but not
            // something I wanted to go over during this tutorial
            //(function (window) {

            //    // holds all our boxes
            //    var boxes2 = [];

            //    // New, holds the 8 tiny boxes that will be our selection handles
            //    // the selection handles will be in this order:
            //    // 0  1  2
            //    // 3     4
            //    // 5  6  7
            //    var selectionHandles = [];

            //    // Hold canvas information
            //    var canvas;
            //    var ctx;
            //    var WIDTH;
            //    var HEIGHT;
            //    var INTERVAL = 20;  // how often, in milliseconds, we check to see if a redraw is needed

            //    var isDrag = false;
            //    //var isResizeDrag = false;
            //    //var expectResize = -1; // New, will save the # of the selection handle if the mouse is over one.
            //    var mx, my; // mouse coordinates

            //    // when set to true, the canvas will redraw everything
            //    // invalidate() just sets this to false right now
            //    // we want to call invalidate() whenever we make a change
            //    var canvasValid = false;

            //    // The node (if any) being selected.
            //    // If in the future we want to select multiple objects, this will get turned into an array
            //    var mySel = null;

            //    // The selection color and width. Right now we have a red selection with a small width
            //    var mySelColor = '#CC0000';
            //    var mySelWidth = 2;
            //    var mySelBoxColor = 'darkred'; // New for selection boxes
            //    var mySelBoxSize = 6;

            //    // we use a fake canvas to draw individual shapes for selection testing
            //    var ghostcanvas;
            //    var gctx; // fake canvas context

            //    // since we can drag from anywhere in a node
            //    // instead of just its x/y corner, we need to save
            //    // the offset of the mouse when we start dragging.
            //    var offsetx, offsety;

            //    // Padding and border style widths for mouse offsets
            //    var stylePaddingLeft, stylePaddingTop, styleBorderLeft, styleBorderTop;

            //    // Box object to hold data
            //    function Box2() {
            //        this.x = 0;
            //        this.y = 0;
            //        this.w = 1; // default width and height?
            //        this.h = 1;
            //        this.fill = '#444444';
            //    }

            //    // New methods on the Box class
            //    Box2.prototype = {
            //        // we used to have a solo draw function
            //        // but now each box is responsible for its own drawing
            //        // mainDraw() will call this with the normal canvas
            //        // myDown will call this with the ghost canvas with 'black'
            //        draw: function (context, optionalColor) {
            //            if (context === gctx) {
            //                context.fillStyle = 'black'; // always want black for the ghost canvas
            //            } else {
            //                context.fillStyle = this.fill;
            //            }

            //            // We can skip the drawing of elements that have moved off the screen:
            //            if (this.x > WIDTH || this.y > HEIGHT) return;
            //            if (this.x + this.w < 0 || this.y + this.h < 0) return;

            //            context.beginPath();
            //            context.moveTo(this.x, this.y);
            //            context.lineTo(this.x, this.y + 10);
            //            context.lineWidth = 3;
            //            context.strokeStyle = '#ff0000';
            //            context.lineCap = 'round';
            //            context.stroke();

            //            context.fillRect(this.x, this.y, this.w, this.h);

            //            // draw selection
            //            // this is a stroke along the box and also 8 new selection handles
            //            if (mySel === this) {
            //                context.strokeStyle = mySelColor;
            //                context.lineWidth = mySelWidth;
            //                context.strokeRect(this.x, this.y, this.w, this.h); //border

            //                // draw the boxes

            //                var half = mySelBoxSize / 2;

            //                // 0  1  2
            //                // 3     4
            //                // 5  6  7

            //                // top left, middle, right
            //                selectionHandles[0].x = this.x - half;
            //                selectionHandles[0].y = this.y - half;

            //                selectionHandles[1].x = this.x + this.w / 2 - half;
            //                selectionHandles[1].y = this.y - half;

            //                selectionHandles[2].x = this.x + this.w - half;
            //                selectionHandles[2].y = this.y - half;

            //                //middle left
            //                selectionHandles[3].x = this.x - half;
            //                selectionHandles[3].y = this.y + this.h / 2 - half;

            //                //middle right
            //                selectionHandles[4].x = this.x + this.w - half;
            //                selectionHandles[4].y = this.y + this.h / 2 - half;

            //                //bottom left, middle, right
            //                selectionHandles[6].x = this.x + this.w / 2 - half;
            //                selectionHandles[6].y = this.y + this.h - half;

            //                selectionHandles[5].x = this.x - half;
            //                selectionHandles[5].y = this.y + this.h - half;

            //                selectionHandles[7].x = this.x + this.w - half;
            //                selectionHandles[7].y = this.y + this.h - half;

            //                context.fillStyle = mySelBoxColor;
            //                for (var i = 0; i < 8; i++) {
            //                    var cur = selectionHandles[i];
            //                    context.fillRect(cur.x, cur.y, mySelBoxSize, mySelBoxSize);
            //                }
            //            }

            //        } // end draw

            //    }

            //    //Initialize a new Box, add it, and invalidate the canvas
            //    function addRect(x, y, w, h, fill) {
            //        var rect = new Box2;
            //        rect.x = x;
            //        rect.y = y;
            //        rect.w = w;
            //        rect.h = h;
            //        rect.fill = fill;
            //        boxes2.push(rect);
            //        invalidate();
            //    }

            //    // initialize our canvas, add a ghost canvas, set draw loop
            //    // then add everything we want to intially exist on the canvas
            //    function init2() {
            //        canvas = document.getElementById('canvas2');
            //        HEIGHT = canvas.height;
            //        WIDTH = canvas.width;
            //        ctx = canvas.getContext('2d');
            //        ghostcanvas = document.createElement('canvas');
            //        ghostcanvas.height = HEIGHT;
            //        ghostcanvas.width = WIDTH;
            //        gctx = ghostcanvas.getContext('2d');

            //        //fixes a problem where double clicking causes text to get selected on the canvas
            //        canvas.onselectstart = function () { return false; }

            //        // fixes mouse co-ordinate problems when there's a border or padding
            //        // see getMouse for more detail
            //        if (document.defaultView && document.defaultView.getComputedStyle) {
            //            stylePaddingLeft = parseInt(document.defaultView.getComputedStyle(canvas, null)['paddingLeft'], 10) || 0;
            //            stylePaddingTop = parseInt(document.defaultView.getComputedStyle(canvas, null)['paddingTop'], 10) || 0;
            //            styleBorderLeft = parseInt(document.defaultView.getComputedStyle(canvas, null)['borderLeftWidth'], 10) || 0;
            //            styleBorderTop = parseInt(document.defaultView.getComputedStyle(canvas, null)['borderTopWidth'], 10) || 0;
            //        }

            //        // make mainDraw() fire every INTERVAL milliseconds
            //        setInterval(mainDraw, INTERVAL);

            //        // set our events. Up and down are for dragging,
            //        // double click is for making new boxes
            //        canvas.onmousedown = myDown;
            //        canvas.onmouseup = myUp;
            //        //canvas.ondblclick = myDblClick;
            //        canvas.onmousemove = myMove;

            //        // set up the selection handle boxes
            //        for (var i = 0; i < 8; i++) {
            //            var rect = new Box2;
            //            selectionHandles.push(rect);
            //        }

            //        // add custom initialization here:


            //        // add a large green rectangle
            //        addRect(260, 70, 60, 65, 'rgba(0,205,0,0.7)');

            //        // add a green-blue rectangle
            //        addRect(240, 120, 40, 40, 'rgba(2,165,165,0.7)');

            //        // add a smaller purple rectangle
            //        addRect(45, 60, 25, 25, 'rgba(150,150,250,0.7)');
            //    }

            //    //wipes the canvas context
            //    function clear(c) {
            //        c.clearRect(0, 0, WIDTH, HEIGHT);
            //    }

            //    // Main draw loop.
            //    // While draw is called as often as the INTERVAL variable demands,
            //    // It only ever does something if the canvas gets invalidated by our code
            //    function mainDraw() {
            //        if (canvasValid == false) {
            //            clear(ctx);

            //            // Add stuff you want drawn in the background all the time here

            //            // draw all boxes
            //            var l = boxes2.length;
            //            for (var i = 0; i < l; i++) {
            //                boxes2[i].draw(ctx); // we used to call drawshape, but now each box draws itself
            //            }

            //            // Add stuff you want drawn on top all the time here

            //            canvasValid = true;
            //        }
            //    }

            //    // Happens when the mouse is moving inside the canvas
            //    function myMove(e) {
            //        if (isDrag) {
            //            getMouse(e);

            //            mySel.x = mx - offsetx;
            //            mySel.y = my - offsety;

            //            // something is changing position so we better invalidate the canvas!
            //            invalidate();
            //        }
            //        //else if (isResizeDrag) {
            //        //    // time ro resize!
            //        //    var oldx = mySel.x;
            //        //    var oldy = mySel.y;

            //        //    // 0  1  2
            //        //    // 3     4
            //        //    // 5  6  7
            //        //    switch (expectResize) {
            //        //        case 0:
            //        //            mySel.x = mx;
            //        //            mySel.y = my;
            //        //            mySel.w += oldx - mx;
            //        //            mySel.h += oldy - my;
            //        //            break;
            //        //        case 1:
            //        //            mySel.y = my;
            //        //            mySel.h += oldy - my;
            //        //            break;
            //        //        case 2:
            //        //            mySel.y = my;
            //        //            mySel.w = mx - oldx;
            //        //            mySel.h += oldy - my;
            //        //            break;
            //        //        case 3:
            //        //            mySel.x = mx;
            //        //            mySel.w += oldx - mx;
            //        //            break;
            //        //        case 4:
            //        //            mySel.w = mx - oldx;
            //        //            break;
            //        //        case 5:
            //        //            mySel.x = mx;
            //        //            mySel.w += oldx - mx;
            //        //            mySel.h = my - oldy;
            //        //            break;
            //        //        case 6:
            //        //            mySel.h = my - oldy;
            //        //            break;
            //        //        case 7:
            //        //            mySel.w = mx - oldx;
            //        //            mySel.h = my - oldy;
            //        //            break;
            //        //    }

            //        //    invalidate();
            //        //}

            //        getMouse(e);
            //        // if there's a selection see if we grabbed one of the selection handles
            //        //if (mySel !== null && !isResizeDrag) {
            //        //    for (var i = 0; i < 8; i++) {
            //        //        // 0  1  2
            //        //        // 3     4
            //        //        // 5  6  7

            //        //        var cur = selectionHandles[i];

            //        //        // we dont need to use the ghost context because
            //        //        // selection handles will always be rectangles
            //        //        if (mx >= cur.x && mx <= cur.x + mySelBoxSize &&
            //        //            my >= cur.y && my <= cur.y + mySelBoxSize) {
            //        //            // we found one!
            //        //            expectResize = i;
            //        //            invalidate();

            //        //            switch (i) {
            //        //                case 0:
            //        //                    this.style.cursor = 'nw-resize';
            //        //                    break;
            //        //                case 1:
            //        //                    this.style.cursor = 'n-resize';
            //        //                    break;
            //        //                case 2:
            //        //                    this.style.cursor = 'ne-resize';
            //        //                    break;
            //        //                case 3:
            //        //                    this.style.cursor = 'w-resize';
            //        //                    break;
            //        //                case 4:
            //        //                    this.style.cursor = 'e-resize';
            //        //                    break;
            //        //                case 5:
            //        //                    this.style.cursor = 'sw-resize';
            //        //                    break;
            //        //                case 6:
            //        //                    this.style.cursor = 's-resize';
            //        //                    break;
            //        //                case 7:
            //        //                    this.style.cursor = 'se-resize';
            //        //                    break;
            //        //            }
            //        //            return;
            //        //        }

            //        //    }
            //        //    // not over a selection box, return to normal
            //        //    isResizeDrag = false;
            //        //    expectResize = -1;
            //        //    this.style.cursor = 'auto';
            //        //}

            //    }

            //    // Happens when the mouse is clicked in the canvas
            //    function myDown(e) {
            //        getMouse(e);

            //        //we are over a selection box
            //        //if (expectResize !== -1) {
            //        //    isResizeDrag = true;
            //        //    return;
            //        //}

            //        clear(gctx);
            //        var l = boxes2.length;
            //        for (var i = l - 1; i >= 0; i--) {
            //            // draw shape onto ghost context
            //            boxes2[i].draw(gctx, 'black');

            //            // get image data at the mouse x,y pixel
            //            var imageData = gctx.getImageData(mx, my, 1, 1);
            //            var index = (mx + my * imageData.width) * 4;

            //            // if the mouse pixel exists, select and break
            //            if (imageData.data[3] > 0) {
            //                mySel = boxes2[i];
            //                offsetx = mx - mySel.x;
            //                offsety = my - mySel.y;
            //                mySel.x = mx - offsetx;
            //                mySel.y = my - offsety;
            //                isDrag = true;

            //                invalidate();
            //                clear(gctx);
            //                return;
            //            }
            //        }
            //        // havent returned means we have selected nothing
            //        mySel = null;
            //        // clear the ghost canvas for next time
            //        clear(gctx);
            //        // invalidate because we might need the selection border to disappear
            //        invalidate();
            //    }

            //    function myUp() {
            //        isDrag = false;
            //        //isResizeDrag = false;
            //        //expectResize = -1;
            //    }

            //    // adds a new node
            //    function myDblClick(e) {
            //        getMouse(e);
            //        // for this method width and height determine the starting X and Y, too.
            //        // so I left them as vars in case someone wanted to make them args for something and copy this code
            //        var width = 20;
            //        var height = 20;
            //        addRect(mx - (width / 2), my - (height / 2), width, height, 'rgba(220,205,65,0.7)');
            //    }

            //    function invalidate() {
            //        canvasValid = false;
            //    }

            //    // Sets mx,my to the mouse position relative to the canvas
            //    // unfortunately this can be tricky, we have to worry about padding and borders
            //    function getMouse(e) {
            //        var element = canvas, offsetX = 0, offsetY = 0;

            //        if (element.offsetParent) {
            //            do {
            //                offsetX += element.offsetLeft;
            //                offsetY += element.offsetTop;
            //            } while ((element = element.offsetParent));
            //        }

            //        // Add padding and border style widths to offset
            //        offsetX += stylePaddingLeft;
            //        offsetY += stylePaddingTop;

            //        offsetX += styleBorderLeft;
            //        offsetY += styleBorderTop;

            //        mx = e.pageX - offsetX;
            //        my = e.pageY - offsetY
            //    }

            //    // If you dont want to use <body onLoad='init()'>
            //    // You could uncomment this init() reference and place the script reference inside the body tag
            //    //init();
            //    window.init2 = init2;
            //})(window);

            //// Andy added, as a replacement for 
            //// <body onLoad="init2()">
            //$(document).ready(function () {
            //    // Your code here
            //    init2();
            //});

            window.addEventListener('load', () => {
                $("#btnSave").click(function () {

                    var image = document.getElementById("canvas").toDataURL("image/png");
                    image = image.replace('data:image/png;base64,', '');

                    $.ajax({
                        type: 'POST',
                        url: "Paint.aspx/GetImage",
                        data: '{ "imageData" : "' + image + '" }',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (msg) {
                            
                        }
                    });
                });

                const canvas = document.querySelector('#canvas');
                const histories = document.querySelector('#histories');
                const ctx = canvas.getContext("2d");
                canvas.height = 500;
                canvas.width = 500;
                ctx.strokeStyle = "red";

                

                let img1 = new Image();

                img1.onload = function () {
                    ctx.drawImage(img1, 0, 0);

                    ctx.beginPath();
                    ctx.moveTo(119, 220);
                    ctx.lineTo(119, 220);
                    ctx.lineWidth = 3;
                    ctx.strokeStyle = '#ff0000';
                    ctx.lineCap = 'round';
                    ctx.stroke();
                }

                img1.src = document.getElementById("image1").src;

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
                        

                        $.ajax({
                            type: 'POST',
                            url: "Paint.aspx/updateImage",
                            data: JSON.stringify(history),
                            contentType: 'application/json; charset=utf-8',
                            dataType: 'json',
                            success: function () {
                                
                                swal("Done!", "It was succesfully deleted!", "success");
                            },
                            error: function (xhr, ajaxOptions, thrownError) {
                                swal("Error deleting!", "Please try again", "error");
                            }
                        });

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

            })
        </script>

        <script>
            let notes = [{ type: "OHFootnoteV1", ohFootnoteLabel: "16", ohFootnoteDetails: "note 2", left: 119.88333129882812, top: 200.26666259765625 }];

            //const canvas = document.querySelector('#canvas');
            //const histories = document.querySelector('#histories');
            //const ctx = canvas.getContext("2d");

            //notes.forEach((note) => {
                
            //    let newNote = document.createElement("div");
            //    newNote.style.display = "flex";
            //    newNote.style.alignItems = "center";
            //    newNote.innerHTML = note.ohFootnoteLabel;

            //    ctx.beginPath();

            //    console.log(note.left, note.top);

            //    ctx.moveTo(note.left, note.top);
            //    ctx.lineTo(note.left, note.top + 10);
            //    ctx.lineWidth = 3;
            //    ctx.strokeStyle = '#ff0000';
            //    ctx.lineCap = 'round';
            //    ctx.stroke();


            //    histories.append(newNote);
            //});

            let nextFootnoteIndex = 17;



        </script>
        <script src="../scripts/sweetalert.min.js"></script>
    </form>

</body>
</html>
