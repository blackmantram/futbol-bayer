package com.pixo.futbolbayer.view.tweens.events
{
	import flash.events.Event;

	public class TweenEvent extends Event
	{
		public static const COMPLETED:String = "TweenEvent.Complete";
		
		public function TweenEvent(type:String) 
		{
			super(type);
		}
		
		override public function clone() : Event 
		{
			return new TweenEvent(type);
		}
	}
}