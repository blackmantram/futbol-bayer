package com.pixo.futbolbayer.view.events
{
	import flash.events.Event;
	
	public class AnimationEvent extends Event
	{
		public static const ANIMATION_FINISHED:String = "AnimationEvent.AnimationFinished";
		
		public function AnimationEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new AnimationEvent(type, bubbles, cancelable);
		}
	}
}