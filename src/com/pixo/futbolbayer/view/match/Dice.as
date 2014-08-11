package com.pixo.futbolbayer.view.match
{
	import com.pixo.futbolbayer.view.events.DiceEvent;
	
	import common.utils.MathUtils;
	
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class Dice extends MovieClip
	{
		public var clip:MovieClip;
		private var timer:Timer;
		private var _value:int;
		
		public function get value():int
		{
			return _value;
		}
		
		public function Dice(clip:MovieClip)
		{
			this.clip = clip;
			clip.stop();
		}
		
		public function roll():void
		{
			clip.gotoAndPlay("animation");
			timer = new Timer(1500);
			timer.addEventListener(TimerEvent.TIMER, handleRollFinished);
			timer.start();
		}
		
		private function handleRollFinished(e:TimerEvent):void
		{
			timer.removeEventListener(TimerEvent.TIMER, handleRollFinished);
			_value = MathUtils.randomRange(1, 6);
			clip.gotoAndStop(_value);
			dispatchEvent(new DiceEvent(DiceEvent.ROLL_FINISHED));
		}
	}
}