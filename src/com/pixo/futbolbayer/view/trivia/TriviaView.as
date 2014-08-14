package com.pixo.futbolbayer.view.trivia
{
	import flash.display.Sprite;
	import flash.text.TextField;
	
	import skins.GameSkin;

	public class TriviaView extends Sprite
	{
		private var question:TextField;
		private var answerA:Answer;
		private var answerB:Answer;
		private var answerC:Answer;
		private var answerD:Answer;
		
		public function TriviaView()
		{
			init();
		}
		
		private function init():void
		{
			var skin:Sprite = new GameSkin.TriviaSkin() as Sprite;
			addChild(skin);
			question = skin.getChildByName("question") as TextField;
			answerA = new Answer(skin.getChildByName("answer_a") as Sprite);
			answerB = new Answer(skin.getChildByName("answer_b") as Sprite);
			answerC = new Answer(skin.getChildByName("answer_c") as Sprite);
			answerD = new Answer(skin.getChildByName("answer_d") as Sprite);
		}
	}
}