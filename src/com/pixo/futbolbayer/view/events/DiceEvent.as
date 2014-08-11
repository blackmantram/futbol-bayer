package com.pixo.futbolbayer.view.events
{
	import flash.events.Event;
	
	public class DiceEvent extends Event
	{
		public static const ROLL_FINISHED:String = "DiceEvent.RollFinished";
		
		public function DiceEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone() : Event 
		{
			return new DiceEvent(type, bubbles, cancelable);
		}
	}
}