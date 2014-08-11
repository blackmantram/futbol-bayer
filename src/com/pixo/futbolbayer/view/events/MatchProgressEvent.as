package com.pixo.futbolbayer.view.events
{
	import com.pixo.futbolbayer.model.datatransferobjects.MatchProgressDTO;
	
	import flash.events.Event;
	
	public class MatchProgressEvent extends Event
	{
		public static const PROGRESS:String = "MatchProgressEvent.Progress";
		
		public function MatchProgressEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone() : Event 
		{
			return new MatchProgressEvent(type, bubbles, cancelable);
		}
	}
}