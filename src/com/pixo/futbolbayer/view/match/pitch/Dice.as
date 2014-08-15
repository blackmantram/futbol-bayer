package com.pixo.futbolbayer.view.match.pitch
{
	import com.pixo.futbolbayer.view.events.DiceEvent;
	
	import common.utils.MathUtils;
	import common.utils.TimerUtils;
	
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class Dice extends MovieClip
	{
		private var clip:MovieClip;
		private var timer:Timer;
				
		public function Dice(clip:MovieClip)
		{
			this.clip = clip;
			clip.gotoAndStop("idle");
			clip.visible = false;
		}
		
		public function roll():void
		{
			clip.visible = true;
			clip.gotoAndStop("animation");
			timer = TimerUtils.startTimer(timer, 1500, handleRollFinished);
		}
		
		private function handleRollFinished(e:TimerEvent):void
		{
			TimerUtils.stopTimer(timer, handleRollFinished);
			timer = TimerUtils.startTimer(timer, 1000, handleDiceDelay);
			var _value:int = MathUtils.randomRange(1, 6);
			clip.gotoAndStop(_value);
			dispatchEvent(new DiceEvent(DiceEvent.ROLL_FINISHED, _value, true));
		}
		
		private function handleDiceDelay(e:TimerEvent):void
		{
			TimerUtils.stopTimer(timer, handleDiceDelay);
			clip.visible = false;
		}
		
		
	}
}