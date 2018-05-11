var canvas = document.getElementById('canvas');
var ctx = canvas.getContext('2d');

function resizeCanvas(width, height){
    canvas.width = width;
    canvas.height = height;
}

function resizeToFit(){
    var width = parseFloat(window.getComputedStyle(canvas).width);
    var height = parseFloat(window.getComputedStyle(canvas).height);
    resizeCanvas(width, height);
}

function isInCircle(click) {
    var v = {
        x: circle.x - click.x,
        y: circle.y - click.y
    };
    return (Math.sqrt(v.x * v.x + v.y * v.y) <= circle.radius);
}

function draw() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    ctx.beginPath();
    ctx.strokeStyle = 'red';
    ctx.lineWidth = '5';
    ctx.fillStyle = 'blue';
    ctx.arc(circle.x, circle.y, circle.radius, 0, 2 * Math.PI);
    ctx.stroke();
    ctx.fill();
}

var container = document.getElementById('container');
var canvas = document.getElementById('canvas');
var ctx = canvas.getContext('2d');

resizeToFit();

function draw() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    ctx.beginPath();
    ctx.strokeStyle = 'red';
    ctx.lineWidth = '5';
    ctx.fillStyle = 'blue';
    ctx.arc(circle.x, circle.y, circle.radius, 0, 2 * Math.PI);
    ctx.stroke();
    ctx.fill();
}

var canvas = document.getElementById('canvas');
var ctx = canvas.getContext('2d');
var circle = {
    x: 15,
    y: 100,
    radius: 15
};
var speed = 5;

resizeToFit();
draw();


setInterval(function() {
	var left = circle.x - 15 + speed;
	var right = circle.x + 15 + speed;
	if (left < 0 || right > canvas.width) {
		speed = -speed;
	}
	circle.x += speed;
	draw();
}, 1000 / 30);

// ctx.beginPath(); //Inicia Path
//     ctx.strokeStyle = 'blue'; //Cor do traço
//     ctx.lineWidth = 5; //Espessura do traço
//     ctx.fillStyle = 'red'; //Cor do preenchimento
//     ctx.moveTo(30, 30); //Move o Ponteiro
//     ctx.lineTo(100, 100); //Traça linha
//     ctx.rect(100, 100, 50, 50); //Traça Retângulo
//     ctx.stroke(); //Desenha Path
//     ctx.fill(); //Preenche Path
    
//     ctx.beginPath();
//     ctx.strokeStyle = 'orange';
//     ctx.fillStyle = 'black';
//     ctx.arc(100, 100, 15, 0, 2*Math.PI); //Circulo
//     ctx.stroke();
//     ctx.fill();

//     ctx.beginPath();