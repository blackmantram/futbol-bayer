package com.pixo.futbolbayer.view.match.pitch.events
{
	import flash.events.Event;
	
	public class PitchEvent extends  Event
	{
		public static const MOVEMENT_COMPLETE:String = "PitchEvent.MovementComplete";
		public static const STEP_COMPLETE:String = "PitchEvent.StepComplete";
		public static const GOAL:String = "PitchEvent.Goal";
		
		public var scoredTeam:int;
		
		public function PitchEvent(type:String, scoredTeam:int=0, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.scoredTeam = scoredTeam;
			super(type, bubbles, cancelable);
		}
		
		override public function clone() : Event 
		{
			return new PitchEvent(type, scoredTeam, bubbles, cancelable);
		}
	}
}