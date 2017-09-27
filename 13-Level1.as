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


//Declare health as variable
var playerHealth:int;
//Declare the coins
var coinCollected:int;
//Var powerup timers
var timerPowerUp:Timer = new Timer(100);
//Make jalapeno background not visible
picJalapenoBackground.visible = false
//var length of Power ups
var powerUpLength:int = 0;
//Dim enemyLocation
var enemyLocation:Number;
var enemyLocation1:Number;
//Declare pepperoni location
var pepperoniLocation:Number;
//Declare Jalapeno location
var jalapenoLocation:Number;
//Declare Pineapple location
var pineappleLocation:Number;
//Dim new enemy
var Enemy:Chef = new Chef();
var Enemy1:GiantFork = new GiantFork();
//Declare new character
var charPlayer:Player = new Player();
//Declare powerups
var jalapenoPowerUp:Jalapeno = new Jalapeno;
var pineapplePowerUp:Pineapple = new Pineapple;
//declare coins
var Pepperoni:Coin1 = new Coin1();
//Declare text
var coinText:TextField = new TextField();
var lifeText:TextField = new TextField();
//Text size


//Disable mouse on Characters
Enemy.mouseEnabled = false
Enemy1.mouseEnabled = false
Pepperoni.mouseEnabled = false
jalapenoPowerUp.mouseEnabled = false
pineapplePowerUp.mouseEnabled = false

//move background
//Dim Timer
var backgroundTimer:Timer = new Timer(25);

//Start timer
backgroundTimer.start();

//call subroutine onTick for each tick of timer
backgroundTimer.addEventListener(TimerEvent.TIMER,onTick2);

//function onTick
function onTick2(ev:TimerEvent){
	//move backgrounds left
	picBackground1.x = picBackground1.x - 10
	picBackground2.x = picBackground2.x - 10
	
	//move background back if it goes off the screen
	if ((picBackground1.x + (picBackground1.width / 2)) < 0 ){
		picBackground1.x = (picBackground2.x + picBackground2.width);
	}
	if ((picBackground2.x + (picBackground2.width / 2)) < 0 ){
		picBackground2.x = (picBackground1.x + picBackground1.width);
	}
}

//Pause button
btnPause.addEventListener(MouseEvent.MOUSE_UP, btnPauseClicked)

function btnPauseClicked(e:MouseEvent){
		switchFrames();
	gotoAndStop(7);
}

//Function to check collision
addEventListener(Event.ENTER_FRAME, handleCollision);

//Spawn the enemies
addChild(Enemy);
addChild(Enemy1);
//Add character
addChild(charPlayer);
//Add Jalapeno
addChild(jalapenoPowerUp);
//Add Pineapple
addChild(pineapplePowerUp);
//Add Coin
addChild(Pepperoni);
//Add text
addChild(coinText);
addChild(lifeText);

//Spawning locations of Enemy
enemyLocation = Math.floor(Math.random() * 3 + 1);
if (enemyLocation == 1)
{
	Enemy.y = 575;
	Enemy1.y = 275;
	Enemy.x = 1200;
	Enemy1.x = 1200;
}
else if (enemyLocation == 2)
{
	Enemy.y = 415;
	Enemy1.y = 550;
	Enemy.x = 1200;
	Enemy1.x = 1200;
}
else
{
	Enemy.y = 245;
	Enemy1.y = 415;
	Enemy.x = 1200;
	Enemy1.x = 1200;
}


//Spawn the coin
pepperoniLocation = Math.floor(Math.random() * 3 + 1);
if (pepperoniLocation == 1)
{
	Pepperoni.x = 1200;
	Pepperoni.y = 270;
}
else if (pepperoniLocation == 2)
{
	Pepperoni.x = 1200;
	Pepperoni.y = 340;
}
else
{
	Pepperoni.x = 1200;
	Pepperoni.y = 550;
}

//spawn Jalapeno
jalapenoPowerUp.x = 1200;
jalapenoPowerUp.y = 100;
//spawn Pineapple
pineapplePowerUp.x = 3000;
pineapplePowerUp.y = 500;

//Starting position of Player
charPlayer.x = 100;
charPlayer.y = 540;

//declare variables for jumping
var grav:Number = 5;
var jumping:Boolean = false;
var jumpPow:Number = 0;
//var boostDownStrength:Number = -50;
var boosting:Boolean = false;


btnDown.addEventListener(MouseEvent.MOUSE_DOWN, onKeyDown1);
stage.addEventListener(Event.ENTER_FRAME, update);

function onKeyDown1(evt:MouseEvent):void
{
	if (MouseEvent.MOUSE_UP)
	{
		if (jumping != true)
		{
			jumpPow = -50;
			jumping = true;
		}
	}
}


function update(evt:Event):void
{
	if (boosting)
	{
		//grav = 40;
		charPlayer.y += 60
		if (charPlayer.y >= 540)
		{
			boosting = false;
			charPlayer.y = 540;
			grav = 5;
		}
	}
	if (jumping)
	{
		charPlayer.y +=  jumpPow;
		jumpPow +=  grav;


		if (charPlayer.y >= 540)
		{
			charPlayer.y = 540;
			jumping = false;
		}
	}

}

btnBoostDown.addEventListener(MouseEvent.MOUSE_DOWN, boostDown);

function boostDown(ev:MouseEvent)
{
	//if character is on the ground do nothing
	if (charPlayer.y >= 540)
	{

	}
	else
	{
		boosting = true;
	}
}
//var enemy speed
var enemySpeed:int = 30;
var enemySpeed1:int = 40;
//Declare coin speed
var coinSpeed:int = 20;
//Declare Jalapeno speed
var jalapenoSpeed:int = 25;
//Declare Pineapple speed
var pineappleSpeed:int = 60
//Add fucntion on frame
addEventListener(Event.ENTER_FRAME, onEnterFrame);

function onEnterFrame(event:Event)
{
	
	
	//move Enemy
	Enemy.x -=  enemySpeed;
	Enemy1.x -=  enemySpeed1;
	//Move coin
	Pepperoni.x -=  coinSpeed;
	//Move jalapeno
	jalapenoPowerUp.x -=  jalapenoSpeed;
	//Move Pineapple
	pineapplePowerUp.x -= pineappleSpeed;



	//move enemy back if it goes off the screen
	if (Enemy.x < 0)
	{
		enemyLocation = Math.floor(Math.random() * 3 + 1);
		if (enemyLocation == 1)
		{
			Enemy.y = 550;
			Enemy.x = 1200;
		}
		else if (enemyLocation == 2)
		{
			Enemy.y = 415;
			Enemy.x = 1200;
		}
		else
		{
			Enemy.y = 275;
			Enemy.x = 1200;
		}
	}
	if (Enemy1.x < 0)
	{
		enemyLocation1 = Math.floor(Math.random() * 3 + 1);
		if (enemyLocation1 == 1)
		{
			Enemy1.y = 550;
			Enemy1.x = 1200;
		}
		else if (enemyLocation1 == 2)
		{
			Enemy1.y = 415;
			Enemy1.x = 1200;
		}
		else
		{
			Enemy1.y = 275;
			Enemy1.x = 1200;
		}
	}

	pepperoniLocation = Math.floor(Math.random() * 3 + 1);
	if (Pepperoni.x < 0)
	{
		if (pepperoniLocation == 1)
		{
			Pepperoni.x = 1200;
			Pepperoni.y = 300;
		}
		else if (pepperoniLocation == 2)
		{
			Pepperoni.x = 1200;
			Pepperoni.y = 240;
		}
		else
		{
			Pepperoni.x = 1200;
			Pepperoni.y = 550;
		}
	}

	//Move Jalapeno back if it goes off the screen
	jalapenoLocation = Math.floor(Math.random() * 3 + 1);
	if (jalapenoPowerUp.x < -100)
	{
		if (jalapenoLocation == 1)
		{
			jalapenoPowerUp.x = 1500;
			jalapenoPowerUp.y = 300;
		}
		else if (jalapenoLocation == 2)
		{
			jalapenoPowerUp.x = 1500;
			jalapenoPowerUp.y = 490;
		}
		else
		{
			jalapenoPowerUp.x = 1500;
			jalapenoPowerUp.y = 100;
		}
	}
	
	//Move pineapple back if it goes off the screen
	pineappleLocation = Math.floor(Math.random() * 3 + 1);
		if (pineapplePowerUp.x < -3000)
	{
		if (pineappleLocation == 1)
		{
			pineapplePowerUp.x = 1500;
			pineapplePowerUp.y = 300;
		}
		else if (pineappleLocation == 2)
		{
			pineapplePowerUp.x = 1500;
			pineapplePowerUp.y = 490;
		}
		else
		{
			pineapplePowerUp.x = 1500;
			pineapplePowerUp.y = 100;
		}
	}

	coinText.defaultTextFormat = format;
	lifeText.defaultTextFormat = format;
	//display coins collected
	coinText.text = String(coinCollected);
	//text position
	coinText.x = 100;
	coinText.y = 50;
if (playerHealth == 0){
	lifeText.text = "Life = 3";
}else if (playerHealth == -1){
	lifeText.text = "Life = 2";
}else if (playerHealth == -2){
	lifeText.text = "Life = 1";
}else if (playerHealth == -3){
	lifeText.text = "Life = 0";
}

//Life Text position
	lifeText.x = 100;
	lifeText.y = 100;
	
	trace(powerUpLength);

}


function switchFrames(){
	
			//remove enemies if they are on stage
			if (Enemy.stage)
			{
				removeChild(Enemy);
			}
			if (Enemy1.stage)
			{
				removeChild(Enemy1);
			}
			if (charPlayer.stage)
			{
				removeChild(charPlayer);
			}
			if (jalapenoPowerUp.stage)
			{
				removeChild(jalapenoPowerUp);
			}
			if (Pepperoni.stage)
			{
				removeChild(Pepperoni);
			}
			if (coinText.stage)
			{
				removeChild(coinText);
			}
			if (lifeText.stage)
			{
				removeChild(lifeText);
			}
			if (pineapplePowerUp.stage)
			{
				removeChild(pineapplePowerUp);
			}
			picJalapenoBackground.visible = false;
			timerPowerUp.stop();
			timerPowerUp.removeEventListener(TimerEvent.TIMER,onTick);
			//Remove background Timer;
			backgroundTimer.removeEventListener(TimerEvent.TIMER,onTick2);
			backgroundTimer.stop();
			removeEventListener(Event.ENTER_FRAME, handleCollision);
			stage.removeEventListener(Event.ENTER_FRAME, update);
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
}
//function to check if collision is true
function handleCollision(ev:Event)
{
	//if character hits enemy
	if ((charPlayer.hitTestObject(Enemy)) || (charPlayer.hitTestObject(Enemy1)))
		{
			//call function that prepares the switching of frames
			switchFrames();
			//Go to questions screen
			gotoAndStop(14);
		}
	//if character hits Pepperoni
	if (charPlayer.hitTestObject(Pepperoni))
	{
		(Pepperoni.x = -10);
		coinCollected = coinCollected + 1;
	}
	//if character hits Jalapeno
	if (charPlayer.hitTestObject(jalapenoPowerUp))
	{
		(jalapenoPowerUp.x = -10);
		//Add to the timer
		timerPowerUp.addEventListener(TimerEvent.TIMER,onTick);
		timerPowerUp.start();
		grav = 3;
		picJalapenoBackground.visible = true
	}
	//if character hits Pineapple
	if (charPlayer.hitTestObject(pineapplePowerUp))
	{
		(jalapenoPowerUp.x = -10);
		//Destroy enemies
		Enemy.x = -10
		Enemy1.x = -10
		
		pineapplePowerUp.x = -10
	}
}

function onTick(ev:TimerEvent)
{
	powerUpLength = powerUpLength + 1;
	if (powerUpLength == 20)
	{
		grav = 5;
		timerPowerUp.stop();
		powerUpLength = 0;
		picJalapenoBackground.visible = false;
	}
}