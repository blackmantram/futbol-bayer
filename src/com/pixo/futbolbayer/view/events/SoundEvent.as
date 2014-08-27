package com.pixo.futbolbayer.view.events
{
	import flash.events.Event;
	
	public class SoundEvent extends Event
	{
		public static const START:String = "SoundEvent.start";
		public static const STOP:String = "SoundEvent.stop";
		public static const SET_VOLUME:String = "SoundEvent.setVolume";
		
		public var soundId:String = "";		
		public var loops:int = 0;
		public var volume:Number = 1;
		
		public function SoundEvent(type:String, soundId:String, loops:int, volume:Number=1, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.soundId = soundId;
			this.loops = loops;
			this.volume = volume;
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new SoundEvent(type, soundId, loops, volume, bubbles, cancelable);
		}
	}
}