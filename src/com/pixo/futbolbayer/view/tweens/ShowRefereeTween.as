package com.pixo.futbolbayer.view.tweens
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Back;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	public class ShowRefereeTween extends BaseTween
	{
		private var object:DisplayObject;
		private var originalPosY:int;
		
		public function tween(object:DisplayObject):void
		{
			this.object = object;
			originalPosY = object.y;
			object.y = object.stage.stageWidth;
			TweenLite.to(object, 0.5, {y:originalPosY, ease:Back.easeOut, onComplete:handleShowComplete})
		}
		
		private function handleShowComplete():void
		{
			TweenLite.to(object, 0.5, {delay:1.75, y:object.stage.stageWidth, ease:Back.easeOut, onComplete:handleComplete})
		}
		
		private function handleComplete():void
		{
			object.y = originalPosY;
			fireTweenCompleteEvent(object);
		}
	}
}