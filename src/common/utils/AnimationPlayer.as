package common.utils
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class AnimationPlayer
	{
		private var activeAnimation:MovieClip;
		private var animationHolder:Sprite;
		private var loader:StreamedContentLoader;
		
		public function AnimationPlayer(holder:Sprite)
		{
			animationHolder = holder;
			loader = new StreamedContentLoader();
			loader.addEventListener(Event.COMPLETE, handleAnimationLoaded);
		}
		
		public function loadAnimation(animationClass:Class):void
		{
			loader.load(animationClass);
		}
		
		private function handleAnimationLoaded(e:Event):void
		{
			playAnimation(loader.content as MovieClip);
		}
		
		private function playAnimation(clip:MovieClip):void
		{
			animationHolder.addChild(clip);
			activeAnimation = clip;
			activeAnimation.addEventListener(Event.ENTER_FRAME, handleEnterFrame);
		}
		
		private function handleEnterFrame(e:Event):void
		{
			if (activeAnimation.currentFrame == activeAnimation.totalFrames)
				removeActiveAnimation();
		}
		
		private function removeActiveAnimation():void
		{
			activeAnimation.stop();
			activeAnimation.removeEventListener(Event.ENTER_FRAME, handleEnterFrame);
			animationHolder.removeChild(activeAnimation);
			activeAnimation = null;
			animationHolder.dispatchEvent(new Event(Event.COMPLETE));
		}
	}
}