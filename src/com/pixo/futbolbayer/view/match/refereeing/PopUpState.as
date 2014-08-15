package com.pixo.futbolbayer.view.match.refereeing
{
	import flash.display.Sprite;

	public class PopUpState
	{
		public var sprite:Sprite;
		public var type:String;
		
		public function PopUpState(background:Sprite, type:String)
		{
			this.sprite = background;
			this.type = type;
		}
	}
}