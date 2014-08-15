package com.pixo.futbolbayer.view.events
{
	import flash.events.Event;

	public class RefereeingEvent extends Event
	{
		public static const REFEREE:String = "RefereeingEvent.Referee";
		
		public function RefereeingEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone() : Event 
		{
			return new RefereeingEvent(type, bubbles, cancelable);
		}
	}
}