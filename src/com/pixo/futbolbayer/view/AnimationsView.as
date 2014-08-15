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