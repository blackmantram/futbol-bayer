package com.pixo.futbolbayer.view.general
{
	import flash.display.Sprite;

	public class ImageSelector extends Selector
	{
		private var itemContainer:Sprite;
		private var _items:Array;
		private var _isDirty:Boolean = false;
		
		public function ImageSelector(skin:Sprite)
		{
			super(skin);
			itemContainer = skin.getChildByName("container") as Sprite;
		}
		
		override protected function executeSelection(index:int):void
		{
			itemContainer.removeChildren();
			itemContainer.addChild(_items[index]);
		}
		
		public function setItems(items:Array, defaultSelectedIndex:int=0):void
		{
			if (!_isDirty)
			{
				_isDirty = true;
				_items = items;
				_defaultIndex = defaultSelectedIndex;
				selectIndex(defaultSelectedIndex);
			}
		}
		
		override protected function get maxIndex():int
		{
			return _items.length;
		}
	}
}