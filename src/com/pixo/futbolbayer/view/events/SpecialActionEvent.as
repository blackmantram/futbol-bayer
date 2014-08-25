package com.pixo.futbolbayer.view.events
{
	import flash.events.Event;
	
	public class SpecialActionEvent extends Event
	{
		public static const SPECIAL_ACTION_TRIGGERED:String = "SpecialActionEvent.SpecialActionTriggered";
		public static const SPECIAL_ACTION_STARTED:String = "SpecialActionEvent.SpecialActionStarted";
		public static const SPECIAL_ACTION_FINISHED:String = "SpecialActionEvent.SpecialActionFinished";
		public static const SPECIAL_ACTION_COMPLETED:String = "SpecialActionEvent.SpecialActionCompleted";
		
		public var playerIndex:int;
		
		public function SpecialActionEvent(type:String, index:int=0, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.playerIndex = index;
			super(type, bubbles, cancelable);
		}
		
		override public function clone() : Event 
		{
			return new SpecialActionEvent(type, playerIndex, bubbles, cancelable);
		}
	}
}