package com.pixo.futbolbayer.view.general
{
	import com.pixo.futbolbayer.view.events.SelectorEvent;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import flashx.textLayout.events.SelectionEvent;

	public class TimeSelector extends Sprite
	{
		public var skin:Sprite;
		private var unitsSelector:NumeralSelector;
		private var tensSelector:NumeralSelector;
		
		public function reset():void
		{
			unitsSelector.reset();
			tensSelector.reset();
		}
		
		public function get selectedTime():int
		{
			return unitsSelector.selectedId + (tensSelector.selectedId * 10);
		}
		
		public function TimeSelector(skin:Sprite)
		{
			this.skin = skin;
			unitsSelector = new NumeralSelector(skin.getChildByName("units_selector") as Sprite, 1);
			tensSelector = new NumeralSelector(skin.getChildByName("tens_selector") as Sprite, 0);
			unitsSelector.addEventListener(SelectorEvent.SELECTED, handleTimeChanged);
			tensSelector.addEventListener(SelectorEvent.SELECTED, handleTimeChanged);
		}
		
		private function handleTimeChanged(e:SelectorEvent):void
		{
			dispatchEvent(e);
		}
	}
}