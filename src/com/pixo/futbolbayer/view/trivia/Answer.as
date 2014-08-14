package com.pixo.futbolbayer.view.trivia
{
	import flash.display.Sprite;
	import flash.text.TextField;
	
	public class Answer extends Sprite
	{
		private var answer_text:TextField;
		private var right_icon:Sprite;
		private var wrong_icon:Sprite;
		
		public function Answer(skin:Sprite):void
		{
			answer_text = skin.getChildByName("answer_text") as TextField;
			right_icon = skin.getChildByName("right") as Sprite;
			wrong_icon = skin.getChildByName("wrong") as Sprite;
			init();
		}
		
		private function init():void
		{
			right_icon.visible = false;
			wrong_icon.visible = false;
		}
	}
}