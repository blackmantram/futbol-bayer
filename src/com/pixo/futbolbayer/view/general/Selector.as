package com.pixo.futbolbayer.view.general
{
	import com.pixo.futbolbayer.view.events.SelectorEvent;
	
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;

	public class Selector extends EventDispatcher
	{
		public var skin:Sprite;
		
		private var nextButton:Sprite;
		private var prevButton:Sprite;
		
		private var _selectedIndex:int;
		
		public function get selectedId():int
		{
			return _selectedIndex;	
		}
		
		public function Selector(skin:Sprite)
		{
			this.skin = skin;
			nextButton = skin.getChildByName("next_button") as Sprite;
			prevButton = skin.getChildByName("prev_button") as Sprite;
			addListeners();
		}
		
		private function addListeners():void
		{
			nextButton.addEventListener(MouseEvent.CLICK, handleNextButtonClick);
			prevButton.addEventListener(MouseEvent.CLICK, handlePrevButtonClick);
		}
		
		private function handleNextButtonClick(e:MouseEvent):void
		{
			selectIndex(_selectedIndex+1);
		}
		
		private function handlePrevButtonClick(e:MouseEvent):void
		{
			selectIndex(_selectedIndex-1);
		}
		
		protected function selectIndex(index:int):void
		{
			setSelectedIndex(index);
			executeSelection(_selectedIndex);
			dispatchSelectedEvent();
		}
		
		protected function executeSelection(index:int):void
		{
			throw new Error("this class is abstract and should be implemented");
		}
		
		protected function get minIndex():int
		{
			return 0;
		}
		
		protected function get maxIndex():int
		{
			throw new Error("this class is abstract and should be implemented");
		}
		
		private function dispatchSelectedEvent():void
		{
			dispatchEvent(new SelectorEvent(SelectorEvent.SELECTED, true));
		}
		
		private function setSelectedIndex(index:int):void
		{
			if (index >= maxIndex)
				_selectedIndex = minIndex;
			else if (index < minIndex)
				_selectedIndex = maxIndex - 1;
			else
				_selectedIndex = index;
		}
	}
}