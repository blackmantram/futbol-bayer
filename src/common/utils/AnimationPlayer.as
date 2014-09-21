package common.utils
{
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.system.LoaderContext;
	
	import mx.core.ByteArrayAsset;
	
	public class AnimationPlayer
	{
		private var activeAnimation:MovieClip;
		private var animationHolder:Sprite;
		private var animationLoader:Loader;
		
		public function AnimationPlayer(holder:Sprite)
		{
			animationHolder = holder;
		}
		
		public function loadAnimation(animationClass:Class):void
		{
			var animationInstance:ByteArrayAsset = new animationClass();
			animationLoader = new Loader();
			animationLoader.contentLoaderInfo.addEventListener(Event.INIT, handleAnimationLoaded);
			var context:LoaderContext = new LoaderContext();
			context.allowCodeImport = true;
			animationLoader.loadBytes(animationInstance, context);
		}
		
		private function handleAnimationLoaded(e:Event):void
		{
			animationLoader.contentLoaderInfo.removeEventListener(Event.INIT, handleAnimationLoaded);
			playAnimation(MovieClip(animationLoader.content));
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