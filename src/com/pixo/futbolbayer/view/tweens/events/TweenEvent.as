package com.pixo.futbolbayer.view.tweens.events
{
	import flash.display.DisplayObject;
	import flash.events.Event;

	public class TweenEvent extends Event
	{
		public static const COMPLETED:String = "TweenEvent.Complete";
		
		public var object:DisplayObject;
		
		public function TweenEvent(type:String, object:DisplayObject) 
		{
			this.object = object;
			super(type);
		}
		
		override public function clone() : Event 
		{
			return new TweenEvent(type, object);
		}
	}
}