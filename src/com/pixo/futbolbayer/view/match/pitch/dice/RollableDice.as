package com.pixo.futbolbayer.view.match.pitch.dice
{
	import com.pixo.futbolbayer.view.tweens.VerticalHideTween;
	import com.pixo.futbolbayer.view.tweens.VerticalShowTween;
	
	import common.utils.MathUtils;
	import common.utils.TimerUtils;
	
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class RollableDice extends Dice
	{
		private var timer:Timer;
				
		public function RollableDice(clip:MovieClip)
		{
			super (clip);
			clip.gotoAndStop("idle");
		}
		
		public override function roll():void
		{
			super.roll();
			clip.gotoAndStop("animation");
			timer = TimerUtils.startTimer(1500, handleRollFinished);
		}
		
		private function handleRollFinished(e:TimerEvent):void
		{
			TimerUtils.stopTimer(timer, handleRollFinished);
			timer = TimerUtils.startTimer(1000, handleDiceDelay);
			var value:int = MathUtils.randomRange(1, 6);
			setValue(value);
			clip.gotoAndStop(value);
		}
		
		private function handleDiceDelay(e:TimerEvent):void
		{
			TimerUtils.stopTimer(timer, handleDiceDelay);
			end();
		}
	}
}