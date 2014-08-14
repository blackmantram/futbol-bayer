package com.pixo.futbolbayer.controller.events
{
	import flash.events.Event;
	
	public class MatchClockEvent extends Event
	{
		public static const TICK:String = "tick";
		
		public var currentTime:int;
		
		public function MatchClockEvent(type:String, currentTime:int, bubbles:Boolean = false, cancelable:Boolean = false) 
		{
			super(type, bubbles, cancelable);
			this.currentTime = currentTime;
		}
	}
}