package com.pixo.futbolbayer.view.events
{
	import com.pixo.futbolbayer.model.datatransferobjects.StartMatchDTO;
	
	import flash.events.Event;
	
	public class StartMatchDataEvent extends Event
	{
		public static const DATA_READY:String = "MatchDataEvent.Ready";
		
		public var startMatchDTO:StartMatchDTO;
		
		public function StartMatchDataEvent(type:String, startMatchDTO:StartMatchDTO, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.startMatchDTO = startMatchDTO;
			super(type, bubbles, cancelable);
		}
		
		override public function clone() : Event 
		{
			return new StartMatchDataEvent(type, startMatchDTO, bubbles, cancelable);
		}
	}
}