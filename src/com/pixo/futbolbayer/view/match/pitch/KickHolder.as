package com.pixo.futbolbayer.view.match.pitch
{
	import assets.animations.KickHolderAnimations;
	
	import common.utils.AnimationPlayer;
	import common.utils.StreamedContentLoader;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class KickHolder
	{
		private var kickAnimations:KickHolderAnimations;
		private var clipContainer:Sprite;
		private var iddleAnimationLoader:StreamedContentLoader;
		private var currentCallBack:Function;
		
		private var animationPlayer:AnimationPlayer;
		
		public function KickHolder(container:Sprite, kickAnimations:KickHolderAnimations)
		{
			clipContainer = container;
			clipContainer.visible = false;
			this.kickAnimations = kickAnimations;
			animationPlayer = new AnimationPlayer(clipContainer);
			clipContainer.addEventListener(Event.COMPLETE, handleAnimationComplete);
		}
		
		public function start():void
		{
			iddleAnimationLoader = new StreamedContentLoader();
			iddleAnimationLoader.addEventListener(Event.COMPLETE, handleIddleAnimationLoaded);
			iddleAnimationLoader.load(kickAnimations.Iddle);	
		}
		
		private function handleIddleAnimationLoaded(e:Event):void
		{
			clipContainer.visible = true;
			clipContainer.addChild(iddleAnimationLoader.content as MovieClip);
		}
		
		public function score(callBack:Function):void
		{
			currentCallBack = callBack;
			playAnimation(kickAnimations.Score);
		}
		
		public function fail(callBack:Function):void
		{
			currentCallBack = callBack;
			playAnimation(kickAnimations.Fail);
		}
		
		private function playAnimation(animationClass:Class):void
		{
			clipContainer.removeChildren();
			animationPlayer.loadAnimation(animationClass);
		}
		
		private function handleAnimationComplete(e:Event):void
		{
			if (currentCallBack != null)
				currentCallBack();
		}
	}
}