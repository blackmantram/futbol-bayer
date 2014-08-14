package com.pixo.futbolbayer.view.tweens
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class ShowRefereeTween extends BaseTween
	{
		private var _object:DisplayObject;
		private var timer:Timer; //temporary timer
		
		override public function tween(object:DisplayObject):void
		{ 
			//TODO: here lies the show referee tween 
			timer = new Timer(1500);
			timer.start();
			timer.addEventListener(TimerEvent.TIMER, onComplete);
			object.visible = true;
			_object = object;
		}
		
		private function onComplete(e:TimerEvent):void //temporary timer event
		{
			timer.stop();
			_object.visible = false;
			fireTweenCompleteEvent();
		}
	}
}