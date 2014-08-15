package com.pixo.futbolbayer.view.match.pitch.events
{
	import flash.events.Event;
	
	public class PitchEvent extends  Event
	{
		public static const MOVEMENT_COMPLETE:String = "PitchEvent.MovementComplete";
		public static const STEP_COMPLETE:String = "PitchEvent.StepComplete";
		
		public function PitchEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone() : Event 
		{
			return new PitchEvent(type, bubbles, cancelable);
		}
	}
}