//
// Draw the ICONS
//
function drawIcon(ctx, x, y, shape) {
	switch (shape) {
		case "alpha":
			drawAlpha(ctx, x, y);
			break;
		case "role":
			drawRole(ctx, x, y)
			break;
		case "activity_space":
			drawActivitySpace(ctx, x, y)
			break;
		case "activity":
			drawActivity(ctx, x, y)
			break;
		case "work_product":
			drawWorkProduct(ctx, x, y)
			break;
		case "pattern":
			drawPattern(ctx, x, y);
			break;
	}
}

function drawAlpha(ctx, x, y) {
	ctx.beginPath();
	ctx.arc(x + 10, y + 10, 5, 0.3 * Math.PI, 1.7 * Math.PI);
	ctx.moveTo(x + 13, y + 6);
	ctx.lineTo(x + 21, y + 15);
	ctx.moveTo(x + 13, y + 14);
	ctx.lineTo(x + 21, y + 5);
	ctx.stroke();
}

function drawRole(ctx, x, y) {
	ctx.beginPath();
	ctx.fillStyle = 'black';
	ctx.arc(x + 10, y + 5, 2, 0, 2 * Math.PI, false);
	ctx.moveTo(x + 10, y + 12);
	ctx.arc(x + 10, y + 12, 4, 0, 2 * Math.PI, false);
	ctx.moveTo(x + 20, y + 5);
	ctx.arc(x + 20, y + 5, 2, 0, 2 * Math.PI, false);
	ctx.moveTo(x + 20, y + 12);
	ctx.arc(x + 20, y + 12, 4, 0, 2 * Math.PI, false);
	ctx.fill();
	ctx.stroke();
}

function drawActivity(ctx, x, y) {
	ctx.beginPath();
	drawActShape(ctx, x, y)
	ctx.stroke();
}

function drawActivitySpace(ctx, x, y) {
	ctx.beginPath();
	ctx.setLineDash([1, 2]);
	drawActShape(ctx, x, y)
	ctx.stroke();
	ctx.setLineDash([])
}

function drawActShape(ctx, x, y) {
	ctx.moveTo(x + 5, y + 5);
	ctx.lineTo(x + 5, y + 15);
	ctx.lineTo(x + 15, y + 15);
	ctx.lineTo(x + 20, y + 10);
	ctx.lineTo(x + 15, y + 5);
	ctx.lineTo(x + 5, y + 5);
}

function drawWorkProduct(ctx, x, y) {
	ctx.beginPath();
	ctx.moveTo(x + 5, y + 5);
	ctx.lineTo(x + 5, y + 15);
	ctx.lineTo(x + 20, y + 15);
	ctx.lineTo(x + 20, y + 10);
	ctx.lineTo(x + 13, y + 5);
	ctx.lineTo(x + 5, y + 5);
	ctx.stroke();
}

function drawPattern(ctx, x, y) {
	ctx.beginPath();
	ctx.moveTo(x + 5, y + 5);
	ctx.lineTo(x + 5, y + 15);
	ctx.lineTo(x + 20, y + 15);
	ctx.lineTo(x + 20, y + 5);
	ctx.lineTo(x + 5, y + 5);
	ctx.moveTo(x + 10, y + 5);
	ctx.lineTo(x + 10, y + 10);
	ctx.lineTo(x + 15, y + 10);
	ctx.lineTo(x + 15, y + 15);
	ctx.stroke();
}

