package com.pixo.futbolbayer.view.events
{
	import flash.events.Event;

	public class MovementEvent extends Event
	{
		public static const MOVEMENT:String = "MovementEvent.Movement";
		
		public var movements:int;
		
		public function MovementEvent(type:String, movements:int, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.movements = movements;
			super(type, bubbles, cancelable);
		}
		
		override public function clone() : Event 
		{
			return new MovementEvent(type, movements, bubbles, cancelable);
		}
	}
}