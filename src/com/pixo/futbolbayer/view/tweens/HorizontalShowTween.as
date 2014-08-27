package com.pixo.futbolbayer.view.tweens
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Back;
	
	import flash.display.DisplayObject;
	
	public class HorizontalShowTween
	{
		public function tween(object:DisplayObject, delay:Number):void
		{
			var originalXPos:int = object.x;
			object.x = -object.width;
			object.alpha = 0;
			TweenLite.to(object, 0.5, {delay:delay, x:originalXPos, alpha:1, ease:Back.easeOut});
		}
	}
}