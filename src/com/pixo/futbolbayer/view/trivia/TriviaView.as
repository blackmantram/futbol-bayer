package com.pixo.futbolbayer.view.trivia
{
	import com.pixo.futbolbayer.service.trivia.Question;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import skins.GameSkin;

	public class TriviaView extends Sprite
	{
		private var questionText:TextField;
		public var answerAText:Answer;
		public var answerBText:Answer;
		public var answerCText:Answer;
		public var answerDText:Answer;
		
		public function TriviaView()
		{
			addSkin();
		}
		
		private function addSkin():void
		{
			var skin:Sprite = new GameSkin.TriviaSkin() as Sprite;
			addChild(skin);
			questionText = skin.getChildByName("question") as TextField;
			answerAText = new Answer(skin.getChildByName("answer_a") as Sprite);
			answerBText = new Answer(skin.getChildByName("answer_b") as Sprite);
			answerCText = new Answer(skin.getChildByName("answer_c") as Sprite);
			answerDText = new Answer(skin.getChildByName("answer_d") as Sprite);
		}
		
		public function showQuestion(question:Question):void
		{
			questionText.text = question.wording;
			answerAText.setText(question.correctAnswer, true);
			answerBText.setText(question.incorrectAnswerA);
			answerCText.setText(question.incorrectAnswerB);
			answerDText.setText(question.incorrectAnswerC);
		}
	}
}