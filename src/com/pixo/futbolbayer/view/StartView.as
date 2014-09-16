package com.pixo.futbolbayer.view
{
	import com.pixo.futbolbayer.view.tweens.VerticalHideTween;
	import com.pixo.futbolbayer.view.tweens.VerticalShowTween;
	
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	
	import skins.GameSkin;
	
	public class StartView extends Slider
	{
		public var startButton:Sprite;
		public var helpButton:Sprite;
		public var backButton:Sprite;
		private var help:Sprite;
		
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
			backButton = skin.getChildByName("back_button") as Sprite;
			help = skin.getChildByName("help") as Sprite;
			backButton.visible = false;
			help.visible = false;
		}
		
		public function showHelp():void
		{
			help.visible = true;
			backButton.visible = true;
			var tween:VerticalShowTween = new VerticalShowTween();
			tween.tween(help, 0);
		}
		
		public function hideHelp():void
		{
			var tween:VerticalHideTween = new VerticalHideTween();
			tween.tween(help, 0, false);
			backButton.visible = false;
		}
		
		protected function animateButtons():void
		{
			var tween:VerticalShowTween = new VerticalShowTween();
			tween.tween(startButton, .25);
			tween.tween(helpButton, 1.25);
		}
		
		override protected function hideContent():void
		{
			startButton.visible = false;
			helpButton.visible = false;
		}
		
		override public function showContent():void
		{
			startButton.visible = true;
			helpButton.visible = true;
			animateButtons();
		}
	}
}