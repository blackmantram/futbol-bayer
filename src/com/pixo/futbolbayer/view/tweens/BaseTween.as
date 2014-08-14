package com.pixo.futbolbayer.view.tweens
{
	import com.pixo.futbolbayer.view.tweens.events.TweenEvent;
	
	import flash.display.DisplayObject;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class BaseTween extends EventDispatcher
	{
		public function tween(object:DisplayObject):void
		{
			throw new Error("this class is abstract and should be implemented");
		}
		
		protected function fireTweenCompleteEvent():void
		{
			dispatchEvent(new TweenEvent(TweenEvent.COMPLETED));
		}
	}
}