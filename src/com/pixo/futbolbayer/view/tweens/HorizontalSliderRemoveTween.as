package com.pixo.futbolbayer.view.tweens
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Back;
	import com.greensock.easing.Circ;
	import com.greensock.easing.Linear;
	
	import flash.display.DisplayObject;

	public class HorizontalSliderRemoveTween extends BaseTween
	{
		private var object:DisplayObject;
		
		public function tween(object:DisplayObject, direction:int=1):void
		{
			this.object = object;
			var finalXPos:int = setFinallXPosition(direction);
			TweenLite.to(object, 0.5, {x:finalXPos, ease:Circ.easeOut, onComplete:handleTweenComplete});
		}
		
		private function handleTweenComplete():void
		{
			fireTweenCompleteEvent(object);
		}
		
		private function setFinallXPosition(direction:int):int
		{
			if (direction > 0)
				return -object.width;
			else
				return object.stage.stageWidth;
		}
	}
}