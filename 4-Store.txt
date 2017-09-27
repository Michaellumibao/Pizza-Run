//Menu button
import flash.events.MouseEvent;
import flash.text.TextField;

stop();
btnMenu.addEventListener(MouseEvent.MOUSE_UP, btnMenuclicked);

var totalCoinsText:TextField = new TextField();

addChild(totalCoinsText);
totalCoinsText.x =185
totalCoinsText.y =565

//Display coins
totalCoinsText.text = String(totalCoins)


btnWinGame.addEventListener(MouseEvent.MOUSE_UP, btnWinclicked);

function btnWinclicked(e:MouseEvent)
{
	if (totalCoins < 25)
	{
		
	}
	else{
		totalCoins = totalCoins - 25
		gotoAndStop(18);
	}
}