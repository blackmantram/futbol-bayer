package com.pixo.futbolbayer.view.match.pitch.dice
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class SelectableDice extends Dice
	{
		public function SelectableDice(clip:MovieClip)
		{
			super (clip);
			clip.dice1.addEventListener(MouseEvent.CLICK, function(e:MouseEvent):void{select(1);});
			clip.dice2.addEventListener(MouseEvent.CLICK, function(e:MouseEvent):void{select(2);});
			clip.dice3.addEventListener(MouseEvent.CLICK, function(e:MouseEvent):void{select(3);});
			clip.dice4.addEventListener(MouseEvent.CLICK, function(e:MouseEvent):void{select(4);});
			clip.dice5.addEventListener(MouseEvent.CLICK, function(e:MouseEvent):void{select(5);});
			clip.dice6.addEventListener(MouseEvent.CLICK, function(e:MouseEvent):void{select(6);});
		}
		
		private function select(val:int):void
		{
			setValue(val);
			end();
		}
	}
}