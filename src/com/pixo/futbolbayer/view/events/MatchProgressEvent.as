package com.pixo.futbolbayer.view.events
{
	import com.pixo.futbolbayer.model.datatransferobjects.MatchProgressDTO;
	
	import flash.events.Event;
	
	public class MatchProgressEvent extends Event
	{
		public static const PROGRESS:String = "MatchProgressEvent.Progress";
		
		public var matchProgressDTO:MatchProgressDTO;
		
		public function MatchProgressEvent(type:String, matchProgressDTO:MatchProgressDTO, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.matchProgressDTO = matchProgressDTO;
			super(type, bubbles, cancelable);
		}
	}
}