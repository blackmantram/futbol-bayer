package com.pixo.futbolbayer.view
{
	import com.pixo.futbolbayer.service.assets.ISoundsService;
	import com.pixo.futbolbayer.view.events.SoundEvent;
	import com.pixo.futbolbayer.view.sounds.GameSoundObject;
	
	import flash.events.MouseEvent;
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
			eventMap.mapListener(view.toggleSoundButton, MouseEvent.CLICK, handleToggleSound);
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
		
		private function handleToggleSound(e:MouseEvent):void
		{
			isSoundActive = !isSoundActive;
			view.setSoundButtonState(isSoundActive);
			toggleSound();
		}
		
		private function playSound(soundId:String, loops:int, volume:Number):void
		{
			createChannel(soundId);
			activeSounds[soundId].channel.stop();
			activeSounds[soundId].isPlaying = true;
			activeSounds[soundId].channel = soundService.getSound(soundId).play(0, loops);
			setVolume(soundId, volume);
		}
		
		private function setVolume(soundId:String, volume:Number, shouldUpdateCurrenVolume:Boolean=true):void
		{
			var soundTransform:SoundTransform = new SoundTransform(isSoundActive ? volume : 0);
			activeSounds[soundId].channel.soundTransform = soundTransform;
			if (shouldUpdateCurrenVolume)
				activeSounds[soundId].currentVolume = volume;
		}
		
		private function stopSound(soundId:String):void
		{
			activeSounds[soundId].channel.stop();
			activeSounds[soundId].isPlaying = false;
		}
		
		private function createChannel(soundId:String):void
		{
			if (activeSounds[soundId] == null)
				activeSounds[soundId] = new GameSoundObject();
		}
		
		private function toggleSound():void
		{
			if (isSoundActive)
				toggleAllSoundsOn();
			else
				toggleAllSoundsOff();
		}
		
		private function toggleAllSoundsOn():void
		{
			for (var soundId:String in activeSounds) 
				if (activeSounds[soundId].isPlaying)
					setVolume(soundId, activeSounds[soundId].currentVolume);
		}
		
		private function toggleAllSoundsOff():void
		{
			for (var soundId:String in activeSounds) 
				setVolume(soundId, 0, false);
		}
	}
}