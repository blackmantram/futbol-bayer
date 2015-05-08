package com.pixo.futbolbayer.view.match.pitch.dice
{
	import com.pixo.futbolbayer.view.events.DiceEvent;
	import com.pixo.futbolbayer.view.tweens.VerticalHideTween;
	import com.pixo.futbolbayer.view.tweens.VerticalShowTween;
	
	import flash.display.MovieClip;
	
	public class Dice extends MovieClip
	{
		protected var clip:MovieClip;
		private var value:int;
		
		public function Dice(clip:MovieClip)
		{
			this.clip = clip; 	
			clip.visible = false;
		}
		
		public function roll():void
		{
			showClip();
		}
		
		private function showClip():void
		{
			var showTween:VerticalShowTween = new VerticalShowTween();
			showTween.tween(clip, 0);
			clip.visible = true;
		}
		
		protected function setValue(value:int):void
		{
			this.value = value;
		}
		
		protected function end():void
		{
			dispatchEvent(new DiceEvent(DiceEvent.ROLL_FINISHED, value, true));
			hideClip();
		}
		
		protected function hideClip():void
		{
			var hideTween:VerticalHideTween = new VerticalHideTween();
			hideTween.tween(clip, 0, false);
		}
	}
}