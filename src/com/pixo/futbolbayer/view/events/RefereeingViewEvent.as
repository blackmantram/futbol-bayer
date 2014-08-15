package com.pixo.futbolbayer.view.events
{
	import flash.events.Event;

	public class RefereeingViewEvent extends Event
	{
		public static const POPUP_COMPLETED:String = "RefereeingViewEvent.PopupCompleted";
		
		public function RefereeingViewEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone() : Event 
		{
			return new RefereeingViewEvent(type, bubbles, cancelable);
		}
	}
}