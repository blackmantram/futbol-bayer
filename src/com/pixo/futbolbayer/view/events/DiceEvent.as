package com.pixo.futbolbayer.view.events
{
	import flash.events.Event;
	
	public class DiceEvent extends Event
	{
		public static const ROLL_FINISHED:String = "DiceEvent.RollFinished";
		
		public var movements:int;
		
		public function DiceEvent(type:String, movements:int, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.movements = movements;
			super(type, bubbles, cancelable);
		}
		
		override public function clone() : Event 
		{
			return new DiceEvent(type, movements, bubbles, cancelable);
		}
	}
}