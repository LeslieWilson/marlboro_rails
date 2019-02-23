const canvas = document.getElementById('myCanvas');
const context = canvas.getContext('2d');
const scoreBoard = document.getElementById('score')
const height = window.innerHeight * 0.5;
const width = window.innerWidth * 0.7;
let startingPoint = [width * 0.1, height / 2];
let x = startingPoint[0]
let y = startingPoint[1]
let dx = 2;
let dy = 3.5;
let xRectangle = width * 0.9;
let yRectangle = height / 2;
let rectangleSpeed = 50;
let score = 0;


function show_image(src, width, height, alt) {
    var img = document.createElement("img");
    img.src = src;
    img.width = width;
    img.height = height;
    img.alt = alt;
    document.getElementById('img').appendChild(img);
}



const init = () => {
    canvas.height = height;
    canvas.width = width;
    scoreBoard.innerHTML = 'Lost: ' + score
    draw();
}

const start = () => {
  setInterval(draw, 10)
}

const restart = () => {
  scoreBoard.innerHTML = 'Lost: ' + score
  x = startingPoint[0]
  y = startingPoint[1]
}

const changeLevel = (level) => {
  switch(level){
    case 1:
      dx = 2;
      dy = 3.5;
      xRectangle = width * 0.9;
      rectangleSpeed = 50
      break;

    case 2:
      dx = 3;
      dy = 4.5;
      xRectangle = width * 0.7;
      rectangleSpeed = 40
      break;

    case 3:
      dx = 4;
      dy = 5.5;
      xRectangle = width * 0.5;
      rectangleSpeed = 30
      break;
  }
  score = 0;
  restart();

}

const draw = () => {
    context.clearRect(0,0, width, height);
    context.beginPath();
    context.fillStyle='black'; //Ball color
    context.arc(x,y,10,0,Math.PI*2,true);
    context.closePath();
    context.fill();
    const randomValue = [0.0009, -0.00093, 0.00092, 0.0007156]
    if(x < 0) dx = -dx + randomChoice(randomValue); //bounce from left side
    if(x > xRectangle){ //touch the bar
      if(yRectangle + 100 > y && yRectangle < y){
        dx = -dx + randomChoice(randomValue);
      }
    }
    if( y < 0 || y > height) dy = -dy + randomChoice(randomValue);
    if (x > xRectangle + 20){
      score++


    show_image('./uni.png', 250,250,'uni');

      restart()
    }
    x += dx;
    y += dy;
    context.beginPath()
    context.fillStyle="black"; //Bar color
    context.rect(xRectangle, yRectangle, 20, 100);
    context.fill()
}

const moveRectangle = (event) => {
  switch (event.keyCode){
    case 32:
      start();
      break;

    case 38:
      if (yRectangle > 10){
        yRectangle -= rectangleSpeed;
      }else{
        yRectangle = 10
      }
      break;

    case 40:
      if (yRectangle < height - 100){
        yRectangle += rectangleSpeed;
      }else{
        yRectangle = height - 100
      }
      break;
  }


}

function randomChoice(arr) {
  return arr[Math.floor(Math.random() * arr.length)];
}

document.addEventListener('keydown', moveRectangle);
