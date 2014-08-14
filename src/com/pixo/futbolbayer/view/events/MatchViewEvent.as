package com.pixo.futbolbayer.view.events
{
	import flash.events.Event;

	public class MatchViewEvent extends Event
	{
		public static const SELECTED:String = "SelectorEvent.Selected";
		
		public function MatchViewEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone() : Event 
		{
			return new SelectorEvent(type, bubbles, cancelable);
		}
	}
}