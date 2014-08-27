package com.pixo.futbolbayer.view.tweens
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Back;
	
	import flash.display.DisplayObject;

	public class VerticalHideTween
	{
		private var object:DisplayObject;
		private var originalYPos:int;
		
		public function tween(object:DisplayObject, delay:Number):void
		{
			this.object = object;
			originalYPos = object.y;
			object.alpha = 1;
			TweenLite.to(object, 0.5, {delay:delay, y:originalYPos+100, alpha:0, ease:Back.easeOut, onComplete:handleComplete});
		}
		
		private function handleComplete():void
		{
			object.y = originalYPos;
		}
	}
}