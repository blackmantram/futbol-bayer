package com.pixo.futbolbayer.view.events
{
	import flash.events.Event;
	
	public class SelectorEvent extends Event
	{
		public static const SELECTED:String = "SelectorEvent.Selected";
		
		public function SelectorEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone() : Event 
		{
			return new SelectorEvent(type, bubbles, cancelable);
		}
	}
}