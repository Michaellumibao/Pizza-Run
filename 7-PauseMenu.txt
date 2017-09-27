
stop();

import flash.events.MouseEvent;
btnMenuPause.addEventListener(MouseEvent.MOUSE_UP, btnMenuclickedDone);

btnInstructionsPause.addEventListener(MouseEvent.MOUSE_UP, btnHelpClicked);
function btnHelpClicked(e:MouseEvent)
{
	gotoAndStop(15);
}

btnPlayPause.addEventListener(MouseEvent.MOUSE_UP, btnPlayclicked);
function btnPlayclicked(e:MouseEvent)
{
	
				if (Level1selected == true)
			{
				gotoAndStop(13);
			}
			else if (Level2selected == true)
			{
				gotoAndStop(16);
			}
			else if (Level3selected == true)
			{
				gotoAndStop(17);
			}
}