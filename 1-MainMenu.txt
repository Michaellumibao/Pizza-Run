//Name: Bethany Gilstorf
//Date: November 23. 2014 
//Project: Pizza Run Setup 


import flash.events.MouseEvent;
stop();


//var Total coins
var totalCoins:int;

//Level selecter
var Level1selected:Boolean = false;
var Level2selected:Boolean = false;
var Level3selected:Boolean = false;

var format:TextFormat = new TextFormat();
format.size = 30;

//reset coins collected to 0
coinCollected = 0
coinCollected2 = 0
coinCollected3 = 0
playerHealth = 0

//Function for when menu is clicked from game
function btnMenuclickedDone(evt:MouseEvent)
{
	//Add to total coins
	Level1selected = false
	Level2selected = false
	Level3selected = false
	totalCoins += coinCollected
	totalCoins += coinCollected2
	totalCoins += coinCollected3
	musicChannel.stop()
	gotoAndStop(1);
}

//Return to menu
function btnMenuclicked(e:MouseEvent)
{
	gotoAndStop(1);
}

btnInstructions.addEventListener(MouseEvent.MOUSE_UP, btnInstructionsclicked);
function btnInstructionsclicked(e:MouseEvent)
{
	gotoAndStop(2);
}
btnLevelSelect.addEventListener(MouseEvent.MOUSE_UP, btnLevelSelectclicked);
function btnLevelSelectclicked(e:MouseEvent)
{
	gotoAndStop(3);
}

btnStore.addEventListener(MouseEvent.MOUSE_UP, btnStoreclicked);
function btnStoreclicked(e:MouseEvent)
{
	gotoAndStop(4);
}
btnCredits.addEventListener(MouseEvent.MOUSE_UP, btnCreditsclicked);
function btnCreditsclicked(e:MouseEvent)
{
	gotoAndStop(6);
}
btnExit.addEventListener(MouseEvent.MOUSE_UP, btnExitclicked);
function btnExitclicked(e:MouseEvent)
{
	NativeApplication.nativeApplication.exit();
}
