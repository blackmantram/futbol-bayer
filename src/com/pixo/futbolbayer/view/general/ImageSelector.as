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
		
		public function setItems(items:Array):void
		{
			if (!_isDirty)
			{
				_isDirty = true;
				_items = items;
				selectIndex(0);
			}
		}
		public function setItems2(items:Array):void
		{
			if (!_isDirty)
			{
				_isDirty = true;
				_items = items;
				selectIndex(11);
			}
		}
		
		override protected function get maxIndex():int
		{
			return _items.length;
		}
	}
}