package com.pixo.futbolbayer.view.tweens
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Back;
	import com.greensock.easing.Circ;
	
	import flash.display.DisplayObject;

	public class HorizontalSliderShowTween extends BaseTween
	{
		private var object:DisplayObject;
		
		public function tween(object:DisplayObject, direction:int=1):void
		{
			this.object = object;
			var originalXPos:int = object.x;
			object.x = getInitialXPosition(direction);	
			TweenLite.to(object, 0.5, {x:originalXPos, ease:Circ.easeOut, onComplete:handleTweenComplete});
		}
		
		private function handleTweenComplete():void
		{
			fireTweenCompleteEvent(object);
		}
		
		private function getInitialXPosition(direction:int):int
		{
			if (direction > 0)
				return -object.width;
			else
				return object.stage.stageWidth;
		}
	}
}