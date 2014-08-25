package com.pixo.futbolbayer.view
{
	import animations.GameAnimations;
	
	import common.utils.TimerUtils;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class AnimationsView extends Sprite
	{
		private var activeAnimation:MovieClip;
		
		private var animationTimer:Timer;
		
		public function playGoal():void
		{
			playAnimation(new GameAnimations.Goal() as MovieClip, 10000);
		}
		
		public function playOffSide():void
		{
			playAnimation(new GameAnimations.OffSide() as MovieClip, 3000);
		}
		
		public function playFault():void
		{
			playAnimation(new GameAnimations.Fault() as MovieClip, 5000);
		}
		
		public function playHandBall():void
		{
			playAnimation(new GameAnimations.HandBall() as MovieClip, 3000);
		}
		
		public function playFreeKick():void
		{
			playAnimation(new GameAnimations.FreeKick() as MovieClip, 3000);
		}
		
		private function playAnimation(clip:MovieClip, duration:int):void
		{
			addChild(clip);
			activeAnimation = clip;
			animationTimer = TimerUtils.startTimer(animationTimer, duration, removeAnimation); 
		}
		
		private function removeAnimation(e:TimerEvent):void
		{
			TimerUtils.stopTimer(animationTimer, removeAnimation);
			removeChild(activeAnimation);
			activeAnimation = null;
			dispatchEvent(new Event(Event.COMPLETE));
		}
	}
}