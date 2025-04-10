
// holds all our boxes and lines
var boxes = [];
var lines = [];

// New, holds the 8 tiny boxes that will be our selection handles
// the selection handles will be in this order:
// 0  1  2
// 3     4
// 5  6  7
var selectionHandles = [];

// Hold canvas information
var canvas;
var ctx;
var WIDTH;
var HEIGHT;
var INTERVAL = 20;  // how often, in milliseconds, we check to see if a redraw is needed

// we use a fake canvas to draw individual shapes for selection testing
var ghostcanvas;
var gctx; // fake canvas context

var isDrag = false;
var isResizeDrag = false;
var expectResize = -1; // New, will save the # of the selection handle if the mouse is over one.
var mx, my; // mouse coordinates

// when set to true, the canvas will redraw everything
// invalidate()  sets this to false right now
// call invalidate() whenever we make a change
var canvasValid = false;

// The node (if any) being selected.
// If in the future we want to select multiple objects, this will get turned into an array
var mySel = null;

// The selection color and width. Right now we have a red selection with a small width
var mySelColor = '#CC0000';
var mySelWidth = 2;
var mySelBoxColor = 'darkred'; // New for selection boxes
var mySelBoxSize = 6;
var LINE_FONT = "14px Arial";
var BOX_FONT = "14px Arial";


// since we can drag from anywhere in a node
// instead of just its x/y corner, we need to save
// the offset of the mouse when we start dragging.
var offsetx, offsety;
var xscroll=0, yscroll=0;

// Padding and border style widths for mouse offsets
var stylePaddingLeft, stylePaddingTop, styleBorderLeft, styleBorderTop;

function Point(x, y) {
  this.x = x;
  this.y = y;
}

// Box object to hold data
function Box() {
  this.x = 0;
  this.y = 0;
  this.w = 1; // default width and height?
  this.h = 1;
  this.fill = '#444444';
  this.text;
  this.id;
  this.assoclines = []; // associations
  this.lines = []; // holds lines of text
  this.nLines; // number of txt lines
  this.fixed = false;
  this.drawMe = true;
  this.lineWidth = 1;
}

// Lines object to hold data
function Line() {
  this.r1;
  this.r2;
  this.endId1;
  this.endId2
  this.fill = '#444444';
  this.text;
  this.direction;
  this.drawMe = true;
}

//Initialize a new Box, add it, and invalidate the canvas
function newRect(id, point, w, h, fill, text, type, lineWidth) {
  var rect = new Box;
  rect.lines = splitWords(text,15);
  rect.nLines = rect.lines.length; 
  rect.id = id;
  rect.x = point.x;
  rect.y = point.y;
  rect.w = w
  rect.h = h;
  rect.fill = fill;
  rect.text = text;
  rect.type = type;
  rect.lineWidth = lineWidth;
  boxes.push(rect);
  invalidate();
  return rect;
}

//Initialize a new line, add it, and invalidate the canvas
function newLine(r1, r2, fill, text, direction) {
  var line = new Line;
  line.r1 = r1;
  line.r2 = r2;
  line.fill = fill;
  line.text = text;
  line.direction = direction;
  lines.push(line);
  invalidate();
  return line;
}

// remove al the lines and boxes
function clearDiagram() {
  boxes = [];
  lines = [];
  invalidate();
}

// find the box based on id
function findBox(text){
  var b = boxes.length;
  for (var i = 0; i < b; i++) {
    if (boxes[i].id == text) {
      return boxes[i];
    }
  }
}

// A line is between 2 boxes r1 and r2
function addLineFromTo(r1, r2, fill, text, direction) {
  let line = newLine(r1, r2, fill, text, direction);
  // add line to boxes.
  r1.addLine(line);
  r2.addLine(line);
}

Box.prototype.addLine =  function (line) {
    this.assoclines.push(line);
    //console.log("Box Lines: " + this.id + " " + this.assoclines.length);
  }

// mainDraw() will call this with the normal canvas
// myDown will call this with the ghost canvas with 'black'
Box.prototype.draw = function (context, optionalColor) {
  if (this.drawMe) {
    context.beginPath();
    if (context === gctx) {
      context.fillStyle = 'black'; // always want black for the ghost canvas
    } else {
      context.fillStyle = this.fill;
    }

    // Skip the drawing of elements that have moved off the screen:
    if (this.x > WIDTH || this.y > HEIGHT) return;
    if (this.x + this.w < 0 || this.y + this.h < 0) return;

    // draw a box with text and icon inside
    drawBoxText(context, this);

    // draw selection. the stroke along the box and 8 new selection handles
    if (mySel === this) {
      context.strokeStyle = mySelColor;
      context.lineWidth = mySelWidth;
      context.strokeRect(this.x, this.y, this.w, this.h);

      // draw the boxes
      var half = mySelBoxSize / 2;

      // top left, middle, right
      selectionHandles[0].x = this.x - half;
      selectionHandles[0].y = this.y - half;

      selectionHandles[1].x = this.x + this.w / 2 - half;
      selectionHandles[1].y = this.y - half;

      selectionHandles[2].x = this.x + this.w - half;
      selectionHandles[2].y = this.y - half;

      //middle left
      selectionHandles[3].x = this.x - half;
      selectionHandles[3].y = this.y + this.h / 2 - half;

      //middle right
      selectionHandles[4].x = this.x + this.w - half;
      selectionHandles[4].y = this.y + this.h / 2 - half;

      //bottom left, middle, right
      selectionHandles[6].x = this.x + this.w / 2 - half;
      selectionHandles[6].y = this.y + this.h - half;

      selectionHandles[5].x = this.x - half;
      selectionHandles[5].y = this.y + this.h - half;

      selectionHandles[7].x = this.x + this.w - half;
      selectionHandles[7].y = this.y + this.h - half;

      context.fillStyle = mySelBoxColor;
      for (var i = 0; i < 8; i++) {
        var cur = selectionHandles[i];
        context.fillRect(cur.x, cur.y, mySelBoxSize, mySelBoxSize);
      }
    }
  }
  } // end draw


Line.prototype.draw = function (context, optionalColor) {
  if (this.drawMe) {
    context.beginPath();
    var p1 = { x: this.r1.x + this.r1.w / 2, y: this.r1.y + this.r1.h / 2 };
    var p2 = { x: this.r2.x + this.r2.w / 2, y: this.r2.y + this.r2.h / 2 };
    context.moveTo(p1.x, p1.y);
    context.lineTo(p2.x, p2.y);
    context.lineWidth = 1;
    context.strokeStyle = this.fill;
    context.stroke();
    context.font = LINE_FONT;
    context.textBaseline = 'bottom';
    drawLineLabel(context, this.text, p1, p2, 'center', 0, this.direction);
  }
}

function drawBoxText(ctx, box) {
  let textHeight = ctx.measureText('M').width;
  // draw box with outline
  ctx.lineWidth = box.lineWidth;
  ctx.strokeStyle = "black";
  if (!box.fixed) {
    box.h = box.h + (box.nLines-1) * textHeight;
    box.fixed = !box.fixed;
  }
  
  ctx.rect(box.x, box.y, box.w, box.h);
  ctx.fill();
  ctx.stroke();

  // draw shape type
  ctx.lineWidth = 1;
  drawIcon(ctx, box.x, box.y, box.type);

  // add text in box
  ctx.font = BOX_FONT;
  ctx.fillStyle = "black";

  let yy  = box.y + box.h / 2 + textHeight / 2 + 2;
  yy = yy - (box.nLines-1) * (textHeight-4);
  
  for (var i = 0; i < box.nLines; i++) {
    textWidth = ctx.measureText(box.lines[i]).width;
    let xx = box.x + box.w / 2 - textWidth / 2;
     ctx.fillText(box.lines[i], xx, yy + i * (textHeight+2));
     }
}

function drawLineLabel(ctx, text, p1, p2, alignment, padding, direction) {
  var flip = false;
  
  if (!alignment) alignment = 'center';
  if (!padding) padding = 0;

  var dx = p2.x - p1.x;
  var dy = p2.y - p1.y;
  var len = Math.sqrt(dx * dx + dy * dy);
  var avail = len - 2 * padding;

  ctx.fillStyle = 'black';
  var textToDraw = text;
  if (ctx.measureText && ctx.measureText(textToDraw).width > avail) {
    while (textToDraw && ctx.measureText(textToDraw + "…").width > avail) textToDraw = textToDraw.slice(0, -1);
    textToDraw += "…";
  }

  // Keep text upright
  var angle = Math.atan2(dy, dx);
  if (angle < -Math.PI / 2 || angle > Math.PI / 2) {
    var p = p1;
    p1 = p2;
    p2 = p;
    dx *= -1;
    dy *= -1;
    angle -= Math.PI;
    flip = true;
  }
 
  // need to flip the direction arrow when text flips
  // and add the unicode double arrows
  if (flip) {
    if(direction === '>') {
      textToDraw = "\u21E6 "+ textToDraw;  //<
    }
    else {
      textToDraw += " \u21E8"; // >
    }
  }
  else {
    if(direction === '>') {
      textToDraw += " \u21E8"; // >
    }
    else {
      textToDraw = "\u21E6 "+ textToDraw; // <
    }
  }

  var p, pad;
  if (alignment == 'center') {
    p = p1;
    pad = 1 / 2;
  } else {
    var left = alignment == 'left';
    p = left ? p1 : p2;
    pad = padding / len * (left ? 1 : -1);
  }
  ctx.save();
  ctx.textAlign = alignment;
  ctx.translate(p.x + dx * pad, p.y + dy * pad);
  ctx.rotate(angle);
  ctx.fillText(textToDraw, 0, 0);
  ctx.restore();
}



// initialize our canvas, add a ghost canvas, set draw loop
// then add everything we want to intially exist on the canvas
function initCanvas() {
  canvas = document.getElementById('drawCanvas');
  container = document.getElementById('drawContainer'); 
  HEIGHT = canvas.height;
  WIDTH = canvas.width;
  ctx = canvas.getContext('2d', { willReadFrequently: true });
  ghostcanvas = document.createElement('canvas');
  ghostcanvas.height = HEIGHT;
  ghostcanvas.width = WIDTH;
  gctx = ghostcanvas.getContext('2d', { willReadFrequently: true });

  //fixes a problem where double clicking causes text to get selected on the canvas
  canvas.onselectstart = function () { return false; }

  // fixes mouse co-ordinate problems when there's a border or padding. see getMouse for more detail
  if (document.defaultView && document.defaultView.getComputedStyle) {
    stylePaddingLeft = parseInt(document.defaultView.getComputedStyle(canvas, null)['paddingLeft'], 10) || 0;
    stylePaddingTop = parseInt(document.defaultView.getComputedStyle(canvas, null)['paddingTop'], 10) || 0;
    styleBorderLeft = parseInt(document.defaultView.getComputedStyle(canvas, null)['borderLeftWidth'], 10) || 0;
    styleBorderTop = parseInt(document.defaultView.getComputedStyle(canvas, null)['borderTopWidth'], 10) || 0;
  }

  // make mainDraw() fire every INTERVAL milliseconds
  setInterval(mainDraw, INTERVAL);

  // set our events. Up and down are for dragging,
  // double click is for making new boxes
   // when container is scrolled get x,y offsets to add to mouse position
  container.onscroll = myscroll;
  canvas.onmousedown = myDown;
  canvas.onmouseup = myUp;
  canvas.ondblclick = myDblClick;
  canvas.onmousemove = myMove;

  // set up the selection handle boxes
  for (var i = 0; i < 8; i++) {
    var rect = new Box;
    selectionHandles.push(rect);
  }

  // add custom initialization here:
  //initThings();
}

// get offsets when container is scrolled
function myscroll() {
  yscroll = container.scrollTop;
  xscroll = container.scrollLeft;
  //console.log("scrollTop: "+ xscroll + " Left: " + yscroll);
}

// get the n points around a node with radius starting at angle
function getPoints(angle, start, radius, n) {
  var points = [];
  var angles = [];
  
  for (var i = 0; i < n; i++) {
    angles[i]=angle;
    angle = angle + 360/n;
    if (angle > 360) {
      angle = angle-360;
    }
    points[i] = getXYAngle(start, radius, angle); 
  }
  return {points:points, angles:angles};
}

function getXYAngle(start, radius, angle) {
  var x = start.x + radius * Math.cos(Math.PI * 2 * angle / 360);
  var y = start.y + radius * Math.sin(Math.PI * 2 * angle / 360);
  var p = new Point(x, y);
  return p;
}
  
// Main draw loop.
// While draw is called as often as the INTERVAL variable demands,
// It only ever does something if the canvas gets invalidated by our code
function mainDraw() {
  if (canvasValid == false) {
    clear(ctx);
    // Add stuff you want drawn in the background all the time here

    // draw all lines
    var l = lines.length;
    for (var i = 0; i < l; i++) {
      lines[i].draw(ctx); // we used to call drawshape, but now each box draws itself
    }

    // draw all boxes
    var b = boxes.length;
    for (var i = 0; i < b; i++) {
      boxes[i].draw(ctx); // we used to call drawshape, but now each box draws itself
    }
    // Add stuff you want drawn on top all the time here
    canvasValid = true;
  }
}


//wipes the canvas context
function clear(c) {
  c.clearRect(0, 0, WIDTH, HEIGHT);
}


// Happens when the mouse is moving inside the canvas
function myMove(e) {
  if (isDrag) {
    getMouse(e);

    mySel.x = mx - offsetx;
    mySel.y = my - offsety;

    // something is changing position so we better invalidate the canvas!
    invalidate();
  } else if (isResizeDrag) {
    // time ro resize!
    var oldx = mySel.x;
    var oldy = mySel.y;

    switch (expectResize) {
      case 0:
        mySel.x = mx;
        mySel.y = my;
        mySel.w += oldx - mx;
        mySel.h += oldy - my;
        break;
      case 1:
        mySel.y = my;
        mySel.h += oldy - my;
        break;
      case 2:
        mySel.y = my;
        mySel.w = mx - oldx;
        mySel.h += oldy - my;
        break;
      case 3:
        mySel.x = mx;
        mySel.w += oldx - mx;
        break;
      case 4:
        mySel.w = mx - oldx;
        break;
      case 5:
        mySel.x = mx;
        mySel.w += oldx - mx;
        mySel.h = my - oldy;
        break;
      case 6:
        mySel.h = my - oldy;
        break;
      case 7:
        mySel.w = mx - oldx;
        mySel.h = my - oldy;
        break;
    }
    invalidate();
  }

  getMouse(e);
  // if there's a selection see if we grabbed one of the selection handles
  if (mySel !== null && !isResizeDrag) {
    for (var i = 0; i < 8; i++) {
      var cur = selectionHandles[i];

      // we dont need to use the ghost context because
      // selection handles will always be rectangles
      if (mx >= cur.x && mx <= cur.x + mySelBoxSize &&
        my >= cur.y && my <= cur.y + mySelBoxSize) {
        // we found one!
        expectResize = i;
        invalidate();

        switch (i) {
          case 0:
            this.style.cursor = 'nw-resize';
            break;
          case 1:
            this.style.cursor = 'n-resize';
            break;
          case 2:
            this.style.cursor = 'ne-resize';
            break;
          case 3:
            this.style.cursor = 'w-resize';
            break;
          case 4:
            this.style.cursor = 'e-resize';
            break;
          case 5:
            this.style.cursor = 'sw-resize';
            break;
          case 6:
            this.style.cursor = 's-resize';
            break;
          case 7:
            this.style.cursor = 'se-resize';
            break;
        }
        return;
      }
    }
    // not over a selection box, return to normal
    isResizeDrag = false;
    expectResize = -1;
    this.style.cursor = 'auto';
  }
}

// Happens when the mouse is clicked in the canvas
function myDown(e) {
  getMouse(e);

  //we are over a selection box
  if (expectResize !== -1) {
    isResizeDrag = true;
    return;
  }

  clear(gctx);
  var l = boxes.length;
  for (var i = l - 1; i >= 0; i--) {
    // draw shape onto ghost context
    boxes[i].draw(gctx, 'black');

    // get image data at the mouse x,y pixel
    var imageData = gctx.getImageData(mx, my, 1, 1);

    // if the mouse pixel exists, select and break
    if (imageData.data[3] > 0) {
      mySel = boxes[i];
      offsetx = mx - mySel.x;
      offsety = my - mySel.y;
      mySel.x = mx - offsetx;
      mySel.y = my - offsety;
      isDrag = true;
      invalidate();
      clear(gctx);
      return;
    }
  }
  // havent returned means we have selected nothing
  mySel = null;
  // clear the ghost canvas for next time
  clear(gctx);
  // invalidate because we might need the selection border to disappear
  invalidate();
}

function myUp() {
  isDrag = false;
  isResizeDrag = false;
  expectResize = -1;
}

// doble click on canvas
function myDblClick(e) {
  getMouse(e);
  console.log("Double Click");
}

function invalidate() {
  canvasValid = false;
}

// Sets mx,my to the mouse position relative to the canvas
// unfortunately this can be tricky, we have to worry about padding and borders
function getMouse(e) {
  var element = canvas, offsetX = 0, offsetY = 0;

  if (element.offsetParent) {
    do {
      offsetX += element.offsetLeft;
      offsetY += element.offsetTop;
    } while ((element = element.offsetParent));
  }

  // Add padding and border style widths to offset
  offsetX += stylePaddingLeft;
  offsetY += stylePaddingTop;
  offsetX += styleBorderLeft;
  offsetY += styleBorderTop;
  mx = e.pageX - offsetX + xscroll;
  my = e.pageY - offsetY + yscroll;
}

function splitWords(sentence, blockLength) {
  const words = sentence.split(' ');
  const blocks = [];
  let currentBlock = '';

  for (let i = 0; i < words.length; i++) {
     const word = words[i];
     if (currentBlock.length + word.length <= blockLength) {
        currentBlock += (currentBlock.length > 0 ? ' ' : '') + word;
     } else {
        blocks.push(currentBlock);
        currentBlock = word;
     }
  }
  if (currentBlock.length > 0) {
     blocks.push(currentBlock);
  }

  return blocks;
}




