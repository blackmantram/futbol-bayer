package com.pixo.futbolbayer.view
{
	import com.pixo.futbolbayer.service.assets.ISoundsService;
	import com.pixo.futbolbayer.view.events.SoundEvent;
	
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.dns.AAAARecord;
	
	import org.robotlegs.mvcs.Mediator;

	public class SoundViewMediator extends Mediator
	{
		[Inject]
		public var view:SoundView;
		
		[Inject]
		public var soundService:ISoundsService;
		
		private var isSoundActive:Boolean = true;
		
		private var activeSounds:Object = new Object();
		
		override public function onRegister():void
		{
			eventMap.mapListener(eventDispatcher, SoundEvent.START,  handleStartSound);
			eventMap.mapListener(eventDispatcher, SoundEvent.STOP,  handleStopSound);
			eventMap.mapListener(eventDispatcher, SoundEvent.SET_VOLUME,  handleSetVolume);
		}
		
		private function handleStartSound(e:SoundEvent):void
		{
			playSound(e.soundId, e.loops, e.volume);
		}
		
		private function handleSetVolume(e:SoundEvent):void
		{
			setVolume(e.soundId, e.volume);
		}
		
		private function handleStopSound(e:SoundEvent):void
		{
			stopSound(e.soundId);
		}
		
		private function playSound(soundId:String, loops:int, volume:Number):void
		{
			if (isSoundActive)
			{
				createChannel(soundId);
				var soundTransform:SoundTransform = new SoundTransform(volume);
				activeSounds[soundId].stop();
				activeSounds[soundId] = soundService.getSound(soundId).play(0, loops, soundTransform);
			}
		}
		
		private function setVolume(soundId:String, volume:Number):void
		{
			var soundTransform:SoundTransform = new SoundTransform(volume);
			activeSounds[soundId].soundTransform = soundTransform;
		}
		
		private function stopSound(soundId:String):void
		{
			activeSounds[soundId].stop();
		}
		
		private function createChannel(soundId:String):void
		{
			if (activeSounds[soundId] == null)
				activeSounds[soundId] = new SoundChannel();
		}
	}
}