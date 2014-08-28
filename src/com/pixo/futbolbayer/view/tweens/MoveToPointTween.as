package com.pixo.futbolbayer.view.tweens
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Linear;
	
	import flash.display.DisplayObject;
	import flash.geom.Point;

	public class MoveToPointTween
	{
		public function tween(object:DisplayObject, point:Point):void
		{
			TweenLite.to(object, 0.1, {x:point.x, y:point.y, ease:Linear.easeNone})
		}
	}
}