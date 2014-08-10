package com.pixo.futbolbayer.view.general
{
	import flash.display.Sprite;
	import flash.text.TextField;

	public class NumeralSelector extends Selector
	{
		private var numberTextfield:TextField;
		private var _startIndex:int;
		
		public function NumeralSelector(skin:Sprite, startIndex:Number=0)
		{
			super(skin);
			numberTextfield = skin.getChildByName("number_text") as TextField;
			_startIndex = startIndex;
			selectIndex(startIndex);
		}
		
		override protected function executeSelection(index:int):void
		{
			numberTextfield.text = index.toString();
		}
		
		override protected function get minIndex():int
		{
			return _startIndex;
		}
		
		override protected function get maxIndex():int
		{
			return 10;
		}
	}
}