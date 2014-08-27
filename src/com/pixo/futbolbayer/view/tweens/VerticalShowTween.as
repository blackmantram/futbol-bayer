package com.pixo.futbolbayer.view.tweens
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Back;
	
	import flash.display.DisplayObject;

	public class VerticalShowTween
	{
		public function tween(object:DisplayObject, delay:Number):void
		{
			var originalYPos:int = object.y;
			object.y += 100;
			object.alpha = 0;
			TweenLite.to(object, 0.5, {delay:delay, y:originalYPos, alpha:1, ease:Back.easeOut});
		}
	}
}