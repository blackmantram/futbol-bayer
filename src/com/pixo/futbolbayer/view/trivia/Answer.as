package com.pixo.futbolbayer.view.trivia
{
	import flash.display.Sprite;
	import flash.text.TextField;
	
	public class Answer extends Sprite
	{
		private var answer_text:TextField;
		
		public function Answer(skin:Sprite):void
		{
			answer_text = skin.getChildByName("answer_text") as TextField;
		}
	}
}