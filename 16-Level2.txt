//Michael Lumibao
//November 28 2014
//Moving Character Scrolling Background Collision

//stop on this frame
stop();

//Import timer
import flash.utils.Timer;
//Import mouse events
import flash.events.MouseEvent;
//Flash events to add enemies
import flash.sampler.NewObjectSample;
//import event
import flash.events.Event;
import flash.events.TimerEvent;
import flash.text.TextField;

//Declare the coins
var coinCollected2:int;
//Var powerup timers
var timerPowerUp2:Timer = new Timer(100);
//Make jalapeno background not visible
picJalapenoBackground2.visible = false;
//var length of Power ups
var powerUpLength2:int = 0;
//Dim enemyLocation
var enemyLocation2:Number;
var enemyLocation21:Number;
var enemyLocation22:Number;
//Declare pepperoni location
var pepperoniLocation2:Number;
//Declare Jalapeno location
var jalapenoLocation2:Number;
//Declare Pineapple location
var pineappleLocation2:Number;
//Dim new enemy
var Enemy2:Banana = new Banana();
var Enemy21:Bench2 = new Bench2();
var Enemy22:Girl = new Girl();
//Declare new character
var charPlayer2:Player = new Player();
//Declare powerups
var jalapenoPowerUp2:Jalapeno = new Jalapeno  ;
var pineapplePowerUp2:Pineapple = new Pineapple  ;
//declare coins
var Pepperoni2:Coin1 = new Coin1();
//Declare text
var coinText2:TextField = new TextField();
var lifeText2:TextField = new TextField();

//Disable mouse on Characters
Enemy2.mouseEnabled = false;
Enemy21.mouseEnabled = false;
Enemy22.mouseEnabled = false;
Pepperoni2.mouseEnabled = false;
jalapenoPowerUp2.mouseEnabled = false;
pineapplePowerUp2.mouseEnabled = false;

//move background
//Dim Timer
var backgroundTimer2:Timer = new Timer(25);

//Start timer
backgroundTimer2.start();

//call subroutine onTick for each tick of timer;
backgroundTimer2.addEventListener(TimerEvent.TIMER,onTick3);

//function onTick;
function onTick3(ev:TimerEvent)
{
	//move backgrounds left
	picBackground21.x = picBackground21.x - 10;
	picBackground22.x = picBackground22.x - 10
	;
	//move background back if it goes off the screen
	if ((picBackground21.x + (picBackground21.width / 2)) < 0 )
	{
		picBackground21.x = (picBackground22.x + picBackground22.width);
	}
	if ((picBackground22.x + (picBackground22.width / 2)) < 0 )
	{
		picBackground22.x = (picBackground21.x + picBackground21.width);
	}
}

//Pause button
btnPause2.addEventListener(MouseEvent.MOUSE_UP, btnPauseClicked2);

function btnPauseClicked2(e:MouseEvent)
{
	switchFrames2();
	gotoAndStop(7);
}

//Function to check collision
addEventListener(Event.ENTER_FRAME, handleCollision2);

//Spawn the enemies
addChild(Enemy2);
addChild(Enemy21);
addChild(Enemy22);
//Add character
addChild(charPlayer2);
//Add Jalapeno
addChild(jalapenoPowerUp2);
//Add Pineapple
addChild(pineapplePowerUp2);
//Add Coin
addChild(Pepperoni2);
//Add text
addChild(coinText2);
addChild(lifeText2);

//Spawning locations of Enemy
enemyLocation2 = Math.floor(Math.random() * 3 + 1);
if (enemyLocation2 == 1)
{
	Enemy2.y = 575;
	Enemy21.y = 275;
	Enemy2.x = 1200;
	Enemy21.x = 1200;
	Enemy22.x = 1200;
	Enemy22.y = 1200;
}
else if (enemyLocation == 2)
{
	Enemy2.y = 415;
	Enemy21.y = 550;
	Enemy2.x = 1200;
	Enemy21.x = 1200;
	Enemy22.x = 1200;
	Enemy22.y = 1200;
}
else
{
	Enemy2.y = 245;
	Enemy21.y = 415;
	Enemy2.x = 1200;
	Enemy21.x = 1200;
	Enemy22.x = 1200;
	Enemy22.y = 1200;
}


//Spawn the coin
pepperoniLocation2 = Math.floor(Math.random() * 3 + 1);
if (pepperoniLocation2 == 1)
{
	Pepperoni2.x = 1200;
	Pepperoni2.y = 270;
}
else if (pepperoniLocation2 == 2)
{
	Pepperoni2.x = 1200;
	Pepperoni2.y = 340;
}
else
{
	Pepperoni2.x = 1200;
	Pepperoni2.y = 550;
}

//spawn Jalapeno
jalapenoPowerUp2.x = 1200;
jalapenoPowerUp2.y = 100;
//spawn Pineapple
pineapplePowerUp2.x = 3000;
pineapplePowerUp2.y = 500;

//Starting position of Player
charPlayer2.x = 100;
charPlayer2.y = 540;

//declare variables for jumping
var grav2:Number = 5;
var jumping2:Boolean = false;
var jumpPow2:Number = 0;
//var boostDownStrength:Number = -50;
var boosting2:Boolean = false;


btnDown2.addEventListener(MouseEvent.MOUSE_DOWN, onKeyDown2);
stage.addEventListener(Event.ENTER_FRAME, update2);

function onKeyDown2(evt:MouseEvent):void
{
	if (MouseEvent.MOUSE_UP)
	{
		if (jumping2 != true)
		{
			jumpPow2 = -50;
			jumping2 = true;
		}
	}
}


function update2(evt:Event):void
{
	if (boosting2)
	{
		//grav = 40;
		charPlayer2.y +=  60;
		if (charPlayer2.y >= 540)
		{
			boosting2 = false;
			charPlayer2.y = 540;
			grav2 = 5;
		}
	}
	if (jumping2)
	{
		charPlayer2.y +=  jumpPow2;
		jumpPow2 +=  grav2;


		if (charPlayer2.y >= 540)
		{
			charPlayer2.y = 540;
			jumping2 = false;
		}
	}

}

btnBoostDown2.addEventListener(MouseEvent.MOUSE_DOWN, boostDown2);

function boostDown2(ev:MouseEvent)
{
	//if character is on the ground do nothing
	if (charPlayer2.y >= 540)
	{

	}
	else
	{
		boosting2 = true;
	}
}
//var enemy speed
var enemySpeed2:int = 30;
var enemySpeed21:int = 40;
var enemySpeed22:int = 50;
//Declare coin speed
var coinSpeed2:int = 20;
//Declare Jalapeno speed
var jalapenoSpeed2:int = 25;
//Declare Pineapple speed
var pineappleSpeed2:int = 60;
//Add fucntion on frame
addEventListener(Event.ENTER_FRAME, onEnterFrame2);

function onEnterFrame2(event:Event)
{


	//move Enemy
	Enemy2.x -=  enemySpeed2;
	Enemy21.x -=  enemySpeed21;
	Enemy22.x -=  enemySpeed22;
	//Move coin
	Pepperoni2.x -=  coinSpeed2;
	//Move jalapeno
	jalapenoPowerUp2.x -=  jalapenoSpeed2;
	//Move Pineapple
	pineapplePowerUp2.x -=  pineappleSpeed2;



	//move enemy back if it goes off the screen
	if (Enemy2.x < 0)
	{
		enemyLocation2 = Math.floor(Math.random() * 3 + 1);
		if (enemyLocation2 == 1)
		{
			Enemy2.y = 550;
			Enemy2.x = 1200;
		}
		else if (enemyLocation2 == 2)
		{
			Enemy2.y = 415;
			Enemy2.x = 1200;
		}
		else
		{
			Enemy2.y = 275;
			Enemy2.x = 1200;
		}
	}
	if (Enemy21.x < 0)
	{
		enemyLocation21 = Math.floor(Math.random() * 3 + 1);
		if (enemyLocation21 == 1)
		{
			Enemy21.y = 550;
			Enemy21.x = 1200;
		}
		else if (enemyLocation21 == 2)
		{
			Enemy21.y = 415;
			Enemy21.x = 1200;
		}
		else
		{
			Enemy21.y = 275;
			Enemy21.x = 1200;
		}
	}
	if (Enemy22.x < -600)
	{
		enemyLocation22 = Math.floor(Math.random() * 3 + 1);
		if (enemyLocation22 == 1)
		{
			Enemy22.y = 100;
			Enemy22.x = 1200;
		}
		else if (enemyLocation22 == 2)
		{
			Enemy22.y = 415;
			Enemy22.x = 1200;
		}
		else
		{
			Enemy22.y = 275;
			Enemy22.x = 1200;
		}
	}
	pepperoniLocation2 = Math.floor(Math.random() * 3 + 1);
	if (Pepperoni2.x < 0)
	{
		if (pepperoniLocation2 == 1)
		{
			Pepperoni2.x = 1200;
			Pepperoni2.y = 300;
		}
		else if (pepperoniLocation2 == 2)
		{
			Pepperoni2.x = 1200;
			Pepperoni2.y = 240;
		}
		else
		{
			Pepperoni2.x = 1200;
			Pepperoni2.y = 550;
		}
	}

	//Move Jalapeno back if it goes off the screen
	jalapenoLocation2 = Math.floor(Math.random() * 3 + 1);
	if (jalapenoPowerUp2.x < -100)
	{
		if (jalapenoLocation2 == 1)
		{
			jalapenoPowerUp2.x = 1500;
			jalapenoPowerUp2.y = 300;
		}
		else if (jalapenoLocation == 2)
		{
			jalapenoPowerUp2.x = 1500;
			jalapenoPowerUp2.y = 490;
		}
		else
		{
			jalapenoPowerUp2.x = 1500;
			jalapenoPowerUp2.y = 100;
		}
	}

	//Move pineapple back if it goes off the screen
	pineappleLocation2 = Math.floor(Math.random() * 3 + 1);
	if (pineapplePowerUp2.x < -3000)
	{
		if (pineappleLocation2 == 1)
		{
			pineapplePowerUp2.x = 1500;
			pineapplePowerUp2.y = 300;
		}
		else if (pineappleLocation2 == 2)
		{
			pineapplePowerUp2.x = 1500;
			pineapplePowerUp2.y = 490;
		}
		else
		{
			pineapplePowerUp2.x = 1500;
			pineapplePowerUp2.y = 100;
		}
	}

	coinText2.defaultTextFormat = format;
	lifeText2.defaultTextFormat = format;
	//display coins collected
	coinText2.text = String(coinCollected2);
	//text position
	coinText2.x = 100;
	coinText2.y = 50;
	if (playerHealth == 0)
	{
		lifeText2.text = "Life = 3";
	}
	else if (playerHealth == -1)
	{
		lifeText2.text = "Life = 2";
	}
	else if (playerHealth == -2)
	{
		lifeText2.text = "Life = 1";
	}
	else if (playerHealth == -3)
	{
		lifeText2.text = "Life = 0";
	}

	//Life Text position
	lifeText2.x = 100;
	lifeText2.y = 100;

	trace(Level1selected);

}


function switchFrames2()
{

	//remove enemies if they are on stage
	if (Enemy2.stage)
	{
		removeChild(Enemy2);
	}
	if (Enemy21.stage)
	{
		removeChild(Enemy21);
	}
	if (Enemy22.stage)
	{
		removeChild(Enemy22);
	}
	if (charPlayer2.stage)
	{
		removeChild(charPlayer2);
	}
	if (jalapenoPowerUp2.stage)
	{
		removeChild(jalapenoPowerUp2);
	}
	if (Pepperoni2.stage)
	{
		removeChild(Pepperoni2);
	}
	if (coinText2.stage)
	{
		removeChild(coinText2);
	}
	if (lifeText2.stage)
	{
		removeChild(lifeText2);
	}
	if (pineapplePowerUp2.stage)
	{
		removeChild(pineapplePowerUp2);
	}
	if (picJalapenoBackground2.visible = true)
	{
		picJalapenoBackground2.visible = false;
	}
	timerPowerUp2.stop();
	timerPowerUp2.removeEventListener(TimerEvent.TIMER,onTick22);
	//Remove background Timer;
	backgroundTimer2.removeEventListener(TimerEvent.TIMER,onTick3);
	backgroundTimer2.stop();
	removeEventListener(Event.ENTER_FRAME, handleCollision2);
	stage.removeEventListener(Event.ENTER_FRAME, update2);
	removeEventListener(Event.ENTER_FRAME, onEnterFrame2);
}
//function to check if collision is true
function handleCollision2(ev:Event)
{
	//if character hits enemy
	if ((charPlayer2.hitTestObject(Enemy2)) || (charPlayer2.hitTestObject(Enemy21)) || (charPlayer2.hitTestObject(Enemy22)))
	{
		//call function that prepares the switching of frames
		switchFrames2();
		//Go to questions screen
		gotoAndStop(14);
		CollisionSound.play();
	}
	//if character hits Pepperoni
	if (charPlayer2.hitTestObject(Pepperoni2))
	{
		(Pepperoni2.x = -10);
		coinCollected2 = coinCollected2 + 1;
		CoinCollected.play();
	}
	//if character hits Jalapeno
	if (charPlayer2.hitTestObject(jalapenoPowerUp2))
	{
		(jalapenoPowerUp2.x = -10);
		//Add to the timer
		timerPowerUp2.addEventListener(TimerEvent.TIMER,onTick22);
		timerPowerUp2.start();
		grav2 = 3;
		picJalapenoBackground2.visible = true;
				PowerUpSound.play();
	}
	//if character hits Pineapple
	if (charPlayer2.hitTestObject(pineapplePowerUp2))
	{
		(jalapenoPowerUp2.x = -10);
		//Destroy enemies
		Enemy2.x = -10;
		Enemy21.x = -10;
		Enemy22.x = -10;
				PowerUpSound.play();
		pineapplePowerUp2.x = -10;
	}
}

function onTick22(ev:TimerEvent)
{
	powerUpLength2 = powerUpLength2 + 1;
	if (powerUpLength2 == 20)
	{
		grav2 = 5;
		timerPowerUp2.stop();
		powerUpLength2 = 0;
		picJalapenoBackground2.visible = false;
	}
}