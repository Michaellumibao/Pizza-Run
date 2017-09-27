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
var coinCollected3:int;
//Var powerup timers
var timerPowerUp3:Timer = new Timer(100);
//Make jalapeno background not visible
picJalapenoBackground3.visible = false;
//var length of Power ups
var powerUpLength3:int = 0;
//Dim enemyLocation
var enemyLocation3:Number;
var enemyLocation31:Number;
var enemyLocation32:Number;
var enemyLocation33:Number;
//Declare pepperoni location
var pepperoniLocation3:Number;
//Declare Jalapeno location
var jalapenoLocation3:Number;
//Declare Pineapple location
var pineappleLocation3:Number;
//Dim new enemy
var Enemy3:Girl = new Girl();
var Enemy31:Bed = new Bed();
var Enemy32:Sandwich = new Sandwich();
var Enemy33:PizzaBox = new PizzaBox();
//Declare new character
var charPlayer3:Player = new Player();
//Declare powerups
var jalapenoPowerUp3:Jalapeno = new Jalapeno  ;
var pineapplePowerUp3:Pineapple = new Pineapple  ;
//declare coins
var Pepperoni3:Coin1 = new Coin1();
//Declare text
var coinText3:TextField = new TextField();
var lifeText3:TextField = new TextField();

//Disable mouse on Characters
Enemy3.mouseEnabled = false;
Enemy31.mouseEnabled = false;
Enemy32.mouseEnabled = false;
Enemy33.mouseEnabled = false;
Pepperoni3.mouseEnabled = false;
jalapenoPowerUp3.mouseEnabled = false;
pineapplePowerUp3.mouseEnabled = false;

//move background
//Dim Timer
var backgroundTimer3:Timer = new Timer(25);

//Start timer
backgroundTimer3.start();

//call subroutine onTick for each tick of timer;
backgroundTimer3.addEventListener(TimerEvent.TIMER,onTick4);

//function onTick;
function onTick4(ev:TimerEvent)
{
	//move backgrounds left
	picBackground31.x = picBackground31.x - 10;
	picBackground32.x = picBackground32.x - 10;
	//move background back if it goes off the screen
	if ((picBackground31.x + (picBackground31.width / 2)) < 0 )
	{
		picBackground31.x = (picBackground32.x + picBackground32.width);
	}
	if ((picBackground32.x + (picBackground32.width / 2)) < 0 )
	{
		picBackground32.x = (picBackground31.x + picBackground31.width);
	}
}

//Pause button
btnPause3.addEventListener(MouseEvent.MOUSE_UP, btnPauseClicked3);

function btnPauseClicked3(e:MouseEvent)
{
	switchFrames3();
	gotoAndStop(7);
}

//Function to check collision
addEventListener(Event.ENTER_FRAME, handleCollision3);

//Spawn the enemies
addChild(Enemy3);
addChild(Enemy31);
addChild(Enemy32);
addChild(Enemy33);
//Add character
addChild(charPlayer3);
//Add Jalapeno
addChild(jalapenoPowerUp3);
//Add Pineapple
addChild(pineapplePowerUp3);
//Add Coin
addChild(Pepperoni3);
//Add text
addChild(coinText3);
addChild(lifeText3);

//Spawning locations of Enemy
enemyLocation3 = Math.floor(Math.random() * 3 + 1);
if (enemyLocation3 == 1)
{
	Enemy3.y = 575;
	Enemy31.y = 275;
	Enemy3.x = 1200;
	Enemy31.x = 1200;
	Enemy32.x = 1200;
	Enemy32.y = 1200;
	Enemy33.x = 1200;
	Enemy33.y = 1200;
}
else if (enemyLocation3 == 2)
{
	Enemy3.y = 415;
	Enemy31.y = 550;
	Enemy3.x = 1200;
	Enemy31.x = 1200;
	Enemy32.x = 1200;
	Enemy32.y = 1200;
	Enemy33.x = 1200;
	Enemy33.y = 1200;
}
else
{
	Enemy3.y = 245;
	Enemy31.y = 415;
	Enemy3.x = 1200;
	Enemy31.x = 1200;
	Enemy32.x = 1200;
	Enemy32.y = 1200;
	Enemy33.x = 1200;
	Enemy33.y = 1200;
}


//Spawn the coin
pepperoniLocation3 = Math.floor(Math.random() * 3 + 1);
if (pepperoniLocation3 == 1)
{
	Pepperoni3.x = 1200;
	Pepperoni3.y = 270;
}
else if (pepperoniLocation3 == 2)
{
	Pepperoni3.x = 1200;
	Pepperoni3.y = 340;
}
else
{
	Pepperoni3.x = 1200;
	Pepperoni3.y = 550;
}

//spawn Jalapeno
jalapenoPowerUp3.x = 1200;
jalapenoPowerUp3.y = 100;
//spawn Pineapple
pineapplePowerUp3.x = 3000;
pineapplePowerUp3.y = 500;

//Starting position of Player
charPlayer3.x = 100;
charPlayer3.y = 540;

//declare variables for jumping
var grav3:Number = 5;
var jumping3:Boolean = false;
var jumpPow3:Number = 0;
//var boostDownStrength:Number = -50;
var boosting3:Boolean = false;


btnDown3.addEventListener(MouseEvent.MOUSE_DOWN, onKeyDown3);
stage.addEventListener(Event.ENTER_FRAME, update3);

function onKeyDown3(evt:MouseEvent):void
{
	if (MouseEvent.MOUSE_UP)
	{
		if (jumping3 != true)
		{
			jumpPow3 = -50;
			jumping3 = true;
		}
	}
}


function update3(evt:Event):void
{
	if (boosting3)
	{
		//grav = 40;
		charPlayer3.y +=  60;
		if (charPlayer3.y >= 540)
		{
			boosting3 = false;
			charPlayer3.y = 540;
			grav3 = 5;
		}
	}
	if (jumping3)
	{
		charPlayer3.y +=  jumpPow3;
		jumpPow3 +=  grav3;


		if (charPlayer3.y >= 540)
		{
			charPlayer3.y = 540;
			jumping3 = false;
		}
	}

}

btnBoostDown3.addEventListener(MouseEvent.MOUSE_DOWN, boostDown3);

function boostDown3(ev:MouseEvent)
{
	//if character is on the ground do nothing
	if (charPlayer3.y >= 540)
	{

	}
	else
	{
		boosting3 = true;
	}
}
//var enemy speed
var enemySpeed3:int = 30;
var enemySpeed31:int = 40;
var enemySpeed32:int = 50;
var enemySpeed33:int = 25;
//Declare coin speed
var coinSpeed3:int = 20;
//Declare Jalapeno speed
var jalapenoSpeed3:int = 25;
//Declare Pineapple speed
var pineappleSpeed3:int = 60;
//Add fucntion on frame
addEventListener(Event.ENTER_FRAME, onEnterFrame3);

function onEnterFrame3(event:Event)
{


	//move Enemy
	Enemy3.x -=  enemySpeed3;
	Enemy31.x -=  enemySpeed31;
	Enemy32.x -=  enemySpeed32;
	Enemy33.x -=  enemySpeed33;
	//Move coin
	Pepperoni3.x -=  coinSpeed3;
	//Move jalapeno
	jalapenoPowerUp3.x -=  jalapenoSpeed3;
	//Move Pineapple
	pineapplePowerUp3.x -=  pineappleSpeed3;



	//move enemy back if it goes off the screen
	if (Enemy3.x < 0)
	{
		enemyLocation3 = Math.floor(Math.random() * 3 + 1);
		if (enemyLocation3 == 1)
		{
			Enemy3.y = 550;
			Enemy3.x = 1200;
		}
		else if (enemyLocation2 == 2)
		{
			Enemy3.y = 415;
			Enemy3.x = 1200;
		}
		else
		{
			Enemy3.y = 275;
			Enemy3.x = 1200;
		}
	}
	if (Enemy31.x < 0)
	{
		enemyLocation31 = Math.floor(Math.random() * 3 + 1);
		if (enemyLocation31 == 1)
		{
			Enemy31.y = 550;
			Enemy31.x = 1200;
		}
		else if (enemyLocation31 == 2)
		{
			Enemy31.y = 415;
			Enemy31.x = 1200;
		}
		else
		{
			Enemy31.y = 275;
			Enemy31.x = 1200;
		}
	}
	if (Enemy33.x < -200)
	{
		enemyLocation33 = Math.floor(Math.random() * 3 + 1);
		if (enemyLocation3 == 1)
		{
			Enemy33.y = 100;
			Enemy33.x = 1200;
		}
		else if (enemyLocation33 == 2)
		{
			Enemy33.y = 415;
			Enemy33.x = 1200;
		}
		else
		{
			Enemy33.y = 275;
			Enemy33.x = 1200;
		}
	}
		if (Enemy32.x < 0)
		{
			enemyLocation32 = Math.floor(Math.random() * 3 + 1);
			if (enemyLocation32 == 1)
			{
				Enemy32.y = 550;
				Enemy32.x = 1200;
			}
			else if (enemyLocation32 == 2)
			{
				Enemy32.y = 415;
				Enemy32.x = 1200;
			}
			else
			{
				Enemy32.y = 275;
				Enemy32.x = 1200;
			}
		}
		pepperoniLocation3 = Math.floor(Math.random() * 3 + 1);
		if (Pepperoni3.x < 0)
		{
			if (pepperoniLocation3 == 1)
			{
				Pepperoni3.x = 1200;
				Pepperoni3.y = 300;
			}
			else if (pepperoniLocation3 == 2)
			{
				Pepperoni3.x = 1200;
				Pepperoni3.y = 240;
			}
			else
			{
				Pepperoni3.x = 1200;
				Pepperoni3.y = 550;
			}
		}

		//Move Jalapeno back if it goes off the screen
		jalapenoLocation3 = Math.floor(Math.random() * 3 + 1);
		if (jalapenoPowerUp3.x < -100)
		{
			if (jalapenoLocation3 == 1)
			{
				jalapenoPowerUp3.x = 1500;
				jalapenoPowerUp3.y = 300;
			}
			else if (jalapenoLocation3 == 2)
			{
				jalapenoPowerUp3.x = 1500;
				jalapenoPowerUp3.y = 490;
			}
			else
			{
				jalapenoPowerUp3.x = 1500;
				jalapenoPowerUp3.y = 100;
			}
		}
		//Move pineapple back if it goes off the screen
		pineappleLocation3 = Math.floor(Math.random() * 3 + 1);
		if (pineapplePowerUp3.x < -3000)
		{
			if (pineappleLocation3 == 1)
			{
				pineapplePowerUp3.x = 1500;
				pineapplePowerUp3.y = 300;
			}
			else if (pineappleLocation3 == 2)
			{
				pineapplePowerUp3.x = 1500;
				pineapplePowerUp3.y = 490;
			}
			else
			{
				pineapplePowerUp3.x = 1500;
				pineapplePowerUp3.y = 100;
			}
		}

		coinText3.defaultTextFormat = format;
		lifeText3.defaultTextFormat = format;
		//display coins collected
		coinText3.text = String(coinCollected3);
		//text position
		coinText3.x = 100;
		coinText3.y = 50;
		if (playerHealth == 0)
		{
			lifeText3.text = "Life = 3";
		}
		else if (playerHealth == -1)
		{
			lifeText3.text = "Life = 2";
		}
		else if (playerHealth == -2)
		{
			lifeText3.text = "Life = 1";
		}
		else if (playerHealth == -3)
		{
			lifeText3.text = "Life = 0";
		}

		//Life Text position
		lifeText3.x = 100;
		lifeText3.y = 100;

		trace(Level1selected);

	
}


function switchFrames3()
{

	//remove enemies if they are on stage
	if (Enemy3.stage)
	{
		removeChild(Enemy3);
	}
	if (Enemy31.stage)
	{
		removeChild(Enemy31);
	}
	if (Enemy32.stage)
	{
		removeChild(Enemy32);
	}
	if (Enemy33.stage)
	{
		removeChild(Enemy33);
	}
	if (charPlayer3.stage)
	{
		removeChild(charPlayer3);
	}
	if (jalapenoPowerUp3.stage)
	{
		removeChild(jalapenoPowerUp3);
	}
	if (Pepperoni3.stage)
	{
		removeChild(Pepperoni3);
	}
	if (coinText3.stage)
	{
		removeChild(coinText3);
	}
	if (lifeText3.stage)
	{
		removeChild(lifeText3);
	}
	if (pineapplePowerUp3.stage)
	{
		removeChild(pineapplePowerUp3);
	}
	if (picJalapenoBackground3.visible = true)
	{
		picJalapenoBackground3.visible = false;
	}
	timerPowerUp3.stop();
	timerPowerUp3.removeEventListener(TimerEvent.TIMER,onTick32);
	//Remove background Timer;
	backgroundTimer3.removeEventListener(TimerEvent.TIMER,onTick4);
	backgroundTimer3.stop();
	removeEventListener(Event.ENTER_FRAME, handleCollision3);
	stage.removeEventListener(Event.ENTER_FRAME, update3);
	removeEventListener(Event.ENTER_FRAME, onEnterFrame3);
}
//function to check if collision is true
function handleCollision3(ev:Event)
{
	//if character hits enemy
	if ((charPlayer3.hitTestObject(Enemy3)) || (charPlayer3.hitTestObject(Enemy31)) || (charPlayer3.hitTestObject(Enemy32)) || (charPlayer3.hitTestObject(Enemy33)))
	{
		//call function that prepares the switching of frames
		switchFrames3();
		//Go to questions screen
		gotoAndStop(14);
		CollisionSound.play();
	}
	//if character hits Pepperoni
	if (charPlayer3.hitTestObject(Pepperoni3))
	{
		(Pepperoni3.x = -10);
		coinCollected3 = coinCollected3 + 1;
		CoinCollected.play();
	}
	//if character hits Jalapeno
	if (charPlayer3.hitTestObject(jalapenoPowerUp3))
	{
		(jalapenoPowerUp3.x = -10);
		//Add to the timer
		timerPowerUp3.addEventListener(TimerEvent.TIMER,onTick32);
		timerPowerUp3.start();
		grav3 = 3;
		picJalapenoBackground3.visible = true;
				PowerUpSound.play();
	}
	//if character hits Pineapple
	if (charPlayer3.hitTestObject(pineapplePowerUp3))
	{
		(jalapenoPowerUp3.x = -10);
		//Destroy enemies
		Enemy3.x = -10;
		Enemy31.x = -10;
		Enemy32.x = -10;
		Enemy33.x = -10;
		pineapplePowerUp3.x = -10;
				PowerUpSound.play();
	}
}

function onTick32(ev:TimerEvent)
{
	powerUpLength3 = powerUpLength3 + 1;
	if (powerUpLength3 == 20)
	{
		grav3 = 5;
		timerPowerUp3.stop();
		powerUpLength3 = 0;
		picJalapenoBackground3.visible = false;
	}
}