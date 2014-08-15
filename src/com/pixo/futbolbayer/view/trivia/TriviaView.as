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
		private var rightIndicator:Sprite;
		private var wrongIndicator:Sprite;
		
		public function TriviaView()
		{
			addSkin();
			init();
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
			rightIndicator = skin.getChildByName("right_answer_indicator") as Sprite;
			wrongIndicator = skin.getChildByName("wrong_answer_indicator") as Sprite;
		}
		
		private function init():void
		{
			rightIndicator.visible = false;
			wrongIndicator.visible = false;
		}
		
		public function showQuestion(question:Question):void
		{
			init();
			questionText.text = question.wording;
			answerAText.setText(question.correctAnswer, true);
			answerBText.setText(question.incorrectAnswerA);
			answerCText.setText(question.incorrectAnswerB);
			answerDText.setText(question.incorrectAnswerC);
		}
		
		public function showSelectedAnswer():void
		{
			
		}
		
		public function showRightIndicator():void
		{
			rightIndicator.visible = true;
		}
		
		public function showWrongIndicator():void
		{
			wrongIndicator.visible = true;
		}
	}
}