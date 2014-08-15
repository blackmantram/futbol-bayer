package com.pixo.futbolbayer.view.events
{
	import flash.events.Event;
	
	public class MatchEvent extends Event
	{
		public static const READY:String = "MatchEvent.Ready";
		public static const NEXT_STEP:String = "MatchEvent.NextStep";
		public static const STEP_FINISHED:String = "MatchEvent.StepFinished";
		public static const START:String = "MatchEvent.Start";
		public static const MOVEMENT:String = "MatchEvent.Movement";
		public static const TURN:String = "MatchEvent.TUrn";
		public static const SHOW_QUESTION:String = "MatchEvent.ShowQuestion";
		public static const YELLOW_CARD:String = "MatchEvent.YellowCard";
		public static const PENALTY:String = "MatchEvent.Penalty";
		public static const EXECUTE_PENALTY:String = "MatchEvent.ExecutePenalty";
		public static const SCORE:String = "MatchEvent.Score";
		public static const END:String = "MatchEvent.End";
		
		public var currentTurn:int;
		
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