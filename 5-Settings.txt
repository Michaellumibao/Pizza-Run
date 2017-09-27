//Menu button
import flash.events.MouseEvent;
stop();
btnMenu.addEventListener(MouseEvent.MOUSE_UP, btnMenuclicked);

btnSoundYes.addEventListener(MouseEvent.MOUSE_UP, btnSoundYesclicked);
function btnSoundYesclicked(e:MouseEvent)
{
	gotoAndStop(5);
}
btnSoundNo.addEventListener(MouseEvent.MOUSE_UP, btnSoundNoclicked);
function btnSoundNoclicked(e:MouseEvent)
{
	gotoAndStop(5);
}
btnMusicYes.addEventListener(MouseEvent.MOUSE_UP, btnMusicYesclicked);
function btnMusicYesclicked(e:MouseEvent)
{
	gotoAndStop(5);
}
