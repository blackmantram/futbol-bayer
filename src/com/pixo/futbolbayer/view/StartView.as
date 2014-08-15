package com.pixo.futbolbayer.view
{
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import com.pixo.futbolbayer.view.tweens.MoveDownwardsTween;
	import skins.GameSkin;
	
	public class StartView extends Sprite
	{
		public var startButton:Sprite;
		public var helpButton:Sprite;
		
		public function StartView()
		{
			init();
			anim();
		}
		
		protected function init():void
		{
			
			var skin:Sprite = new GameSkin.StartSkin() as Sprite;
			addChild(skin);
			startButton = skin.getChildByName("start_button") as Sprite;
			helpButton = skin.getChildByName("help_button") as Sprite;
						
		}   
		protected function anim():void
		{
			var startTween:MoveDownwardsTween = new MoveDownwardsTween();
			startTween.tween(startButton);
			var helpTween:MoveDownwardsTween = new MoveDownwardsTween();
			helpTween.tween1(helpButton);
						
		}  
	}
}