package com.pixo.futbolbayer.view.tweens
{
	import com.pixo.futbolbayer.view.tweens.events.TweenEvent;
	
	import flash.display.DisplayObject;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class BaseTween extends EventDispatcher
	{
		protected function fireTweenCompleteEvent(object:DisplayObject):void
		{
			dispatchEvent(new TweenEvent(TweenEvent.COMPLETED, object));
		}
	}
}