package com.pixo.futbolbayer.view.match.pitch
{
	import com.pixo.futbolbayer.view.events.DiceEvent;
	import com.pixo.futbolbayer.view.tweens.VerticalHideTween;
	import com.pixo.futbolbayer.view.tweens.VerticalShowTween;
	
	import common.utils.MathUtils;
	import common.utils.TimerUtils;
	
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class Dice extends MovieClip
	{
		private var clip:MovieClip;
		private var timer:Timer;
		private var value:int;
				
		public function Dice(clip:MovieClip)
		{
			this.clip = clip;
			clip.gotoAndStop("idle");
			clip.visible = false;
		}
		
		public function roll():void
		{
			showClip();
			clip.gotoAndStop("animation");
			timer = TimerUtils.startTimer(1500, handleRollFinished);
		}
		
		private function handleRollFinished(e:TimerEvent):void
		{
			TimerUtils.stopTimer(timer, handleRollFinished);
			timer = TimerUtils.startTimer(1000, handleDiceDelay);
			value = MathUtils.randomRange(1, 6);
			clip.gotoAndStop(value);
		}
		
		private function handleDiceDelay(e:TimerEvent):void
		{
			dispatchEvent(new DiceEvent(DiceEvent.ROLL_FINISHED, value, true));
			TimerUtils.stopTimer(timer, handleDiceDelay);
			hideClip();
		}
		
		private function showClip():void
		{
			var showTween:VerticalShowTween = new VerticalShowTween();
			showTween.tween(clip, 0);
			clip.visible = true;
		}
		
		private function hideClip():void
		{
			var hideTween:VerticalHideTween = new VerticalHideTween();
			hideTween.tween(clip, 0, false);
		}
	}
}