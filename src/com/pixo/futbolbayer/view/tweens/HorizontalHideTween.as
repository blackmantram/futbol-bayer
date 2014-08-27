package com.pixo.futbolbayer.view.tweens
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Back;
	
	import flash.display.DisplayObject;
	
	public class HorizontalHideTween
	{
		private var object:DisplayObject;
		private var originalXPos:int;
		
		public function tween(object:DisplayObject, delay:Number):void
		{
			this.object = object;
			originalXPos = object.x;
			object.alpha = 1;
			TweenLite.to(object, 0.5, {delay:delay, x:-object.width, alpha:0, ease:Back.easeOut, onComplete:handleComplete});
		}
		
		private function handleComplete():void
		{
			object.x = originalXPos;
			object.visible = false;
		}
	}
}