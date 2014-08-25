package com.pixo.futbolbayer.view.events
{
	import flash.events.Event;
	
	public class ReverseEvent extends Event
	{
		public static const REVERSE:String = "reverse";
		
		public var direction:int;
		
		public function ReverseEvent(type:String, direction:int, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.direction = direction;
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new ReverseEvent(type, direction, bubbles, cancelable);
		}
	}
}