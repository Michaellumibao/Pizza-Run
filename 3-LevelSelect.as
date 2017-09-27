//Menu button
import flash.events.MouseEvent;
import flash.media.Sound;
import flash.media.SoundChannel;
import flash.net.URLRequest;
import flash.events.Event;

stop();
btnMenu.addEventListener(MouseEvent.MOUSE_UP, btnMenuclicked);

//Declare music for levels
var Music:Sound = new Sound();
var musicChannel:SoundChannel = new SoundChannel();
Music.load(new URLRequest("PizzaRunSongv2.mp3"));
//Event Listener for loops
musicChannel.addEventListener(Event.SOUND_COMPLETE, loopMusic);

//Ding coin sound
var CoinCollected:Sound = new CoinCollect();
//Collision sound
var CollisionSound:Sound = new Collisionv2();
//PowerUpSound
var PowerUpSound:Sound = new PowerUpDing();
//Level 1;
btnLevel1.addEventListener(MouseEvent.MOUSE_UP, btnLevel1clicked);
function btnLevel1clicked(e:MouseEvent)
{
	Level1selected = true;
	Level2selected = false;
	Level3selected = false;
	musicChannel = Music.play();
	musicChannel.addEventListener(Event.SOUND_COMPLETE, loopMusic);
	gotoAndStop(13);
}

//Level 2

btnLevel2.addEventListener(MouseEvent.MOUSE_UP, btnLevel2clicked);
function btnLevel2clicked(e:MouseEvent)
{
	Level1selected = false;
	Level2selected = true;
	Level3selected = false;
	musicChannel = Music.play();
	musicChannel.addEventListener(Event.SOUND_COMPLETE, loopMusic);
	gotoAndStop(16);
}

//Level 3

stop();
btnLevel3.addEventListener(MouseEvent.MOUSE_UP, btnLevel3clicked);
function btnLevel3clicked(e:MouseEvent)
{
	Level1selected = false;
	Level2selected = false;
	Level3selected = true;
	musicChannel = Music.play();
	musicChannel.addEventListener(Event.SOUND_COMPLETE, loopMusic);
	gotoAndStop(17);
}

function loopMusic(e:Event)
{
	if (musicChannel != null)
	{
		musicChannel.removeEventListener(Event.SOUND_COMPLETE, loopMusic);
		musicChannel = Music.play();
	}
}
