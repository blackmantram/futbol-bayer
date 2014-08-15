package com.pixo.futbolbayer.view.trivia
{
	import com.pixo.futbolbayer.view.trivia.evemts.TriviaEvent;
	
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	public class Answer extends Sprite
	{
		private var answerText:TextField;
		private var button:SimpleButton;
		private var _isCorrect:Boolean;
		
		public function Answer(skin:Sprite):void
		{
			answerText = skin.getChildByName("answer_text") as TextField;
			button = skin.getChildByName("button") as SimpleButton;
			button.addEventListener(MouseEvent.CLICK, handleSelected);
		}
		
		private function handleSelected(e:MouseEvent):void
		{
			dispatchEvent(new TriviaEvent(TriviaEvent.SELECTED_ANSWER, _isCorrect));
		}
		
		public function get isCorrect():Boolean
		{
			return _isCorrect;
		}
		
		public function setText(text:String, isCorrect:Boolean=false):void
		{
			answerText.text = text;
			_isCorrect = isCorrect;
		}
	}
}