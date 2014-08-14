package com.pixo.futbolbayer.view.events
{
	import com.pixo.futbolbayer.model.datatransferobjects.MatchProgressDTO;
	
	import flash.events.Event;
	
	public class MatchEvent extends Event
	{
		public static const START:String = "MatchEvent.Start";
		public static const MOVEMENT:String = "MatchEvent.Movement";
		public static const TURN:String = "MatchEvent.TUrn";
		public static const SHOW_QUESTION:String = "MatchEvent.ShowQuestion";
		
		public function MatchEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone() : Event 
		{
			return new MatchEvent(type, bubbles, cancelable);
		}
	}
}