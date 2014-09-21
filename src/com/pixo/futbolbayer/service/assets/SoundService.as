package com.pixo.futbolbayer.service.assets
{
	import com.pixo.futbolbayer.view.GameSoundIds;
	
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.media.Sound;
	import flash.net.URLRequest;
	
	import org.robotlegs.mvcs.Actor;
	
	import assets.skins.GameSkin;
	
	public class SoundService extends Actor implements ISoundsService
	{
		private var soundsObject:Object;
		
		public function loadSounds():void
		{
			soundsObject = new Object();
			soundsObject[GameSoundIds.LOOP] = new Sound(new URLRequest("assets/sounds/loop.mp3"));
			soundsObject[GameSoundIds.WHISTLE] = new Sound(new URLRequest("assets/sounds/pito.mp3"));
			soundsObject[GameSoundIds.AMBIENCE] = new Sound(new URLRequest("assets/sounds/previo_partido.mp3"));
		}
		
		public function getSound(sound:String):Sound
		{
			return soundsObject[sound] as Sound;
		}
	}
}