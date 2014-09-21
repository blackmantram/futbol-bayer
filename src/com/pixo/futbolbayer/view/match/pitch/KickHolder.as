package com.pixo.futbolbayer.view.match.pitch
{
	import assets.animations.KickHolderAnimations;
	
	import common.utils.AnimationPlayer;
	import common.utils.TimerUtils;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class KickHolder
	{
		private var kickAnimations:KickHolderAnimations;
		private var clipContainer:Sprite;
		private var currentAnimation:MovieClip;
		private var timer:Timer;
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
			clipContainer.visible = true;
			animationPlayer.loadAnimation(kickAnimations.Iddle);
			//addAnimation(new kickAnimations.Iddle() as MovieClip);	
		}
		
		public function score(callBack:Function):void
		{
			currentCallBack = callBack;
			animationPlayer.loadAnimation(kickAnimations.Score);
			//addAnimation(new kickAnimations.Score as MovieClip);
			//timer = TimerUtils.startTimer(timer, 1000, handleTimerStopped);
		}
		
		public function fail(callBack:Function):void
		{
			animationPlayer.loadAnimation(kickAnimations.Fail);
			//addAnimation(new kickAnimations.Fail as MovieClip);
			currentCallBack = callBack;
			//timer = TimerUtils.startTimer(timer, 1000, handleTimerStopped);
		}
		
		/*private function addAnimation(animation:MovieClip):void
		{
			clipContainer.addChild(animation);
			if (currentAnimation != null && clipContainer.contains(currentAnimation))
				clipContainer.removeChild(currentAnimation);
			currentAnimation = animation;
		}*/
		
		public function stop():void
		{
			//clipContainer.visible = false;
			//clipContainer.removeChildren();
		}
		
		private function handleAnimationComplete(e:TimerEvent):void
		{
			//TimerUtils.stopTimer(timer, currentCallBack);
			currentCallBack();
		}
	}
}