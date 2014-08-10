package com.pixo.futbolbayer.view
{
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	
	import skins.GameSkin;
	
	public class StartView extends Sprite
	{
		public var startButton:Sprite;
		public var helpButton:Sprite;
		
		public function StartView()
		{
			init();
		}
		
		protected function init():void
		{
			var skin:Sprite = new GameSkin.StartSkin() as Sprite;
			addChild(skin);
			startButton = skin.getChildByName("start_button") as Sprite;
			helpButton = skin.getChildByName("help_button") as Sprite;
		}   
	}
}