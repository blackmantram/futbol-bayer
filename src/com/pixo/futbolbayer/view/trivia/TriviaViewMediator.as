package com.pixo.futbolbayer.view.trivia
{
	import com.pixo.futbolbayer.service.trivia.IQuestionsParser;
	import com.pixo.futbolbayer.service.trivia.QuestionsParser;
	import com.pixo.futbolbayer.view.events.MatchEvent;
	import com.pixo.futbolbayer.view.trivia.evemts.TriviaEvent;
	
	import flash.events.MouseEvent;
	
	import org.robotlegs.mvcs.Mediator;

	public class TriviaViewMediator extends Mediator
	{
		[Inject]
		public var view:TriviaView;
		
		[Inject]
		public var questionsParser:IQuestionsParser;
		
		override public function onRegister():void
		{
			view.visible = false;
			eventMap.mapListener(eventDispatcher, MatchEvent.SHOW_QUESTION, handleShowQuestion );
			eventMap.mapListener(view.answerAText, TriviaEvent.SELECTED_ANSWER, handleAnswerSelected);
			eventMap.mapListener(view.answerBText, TriviaEvent.SELECTED_ANSWER, handleAnswerSelected);
			eventMap.mapListener(view.answerCText, TriviaEvent.SELECTED_ANSWER, handleAnswerSelected);
			eventMap.mapListener(view.answerDText, TriviaEvent.SELECTED_ANSWER, handleAnswerSelected);
		}
		
		private function handleShowQuestion(e:MatchEvent):void
		{
			view.visible = true;
			view.showQuestion(questionsParser.getQuestion());
		}
		
		private function handleAnswerSelected(e:TriviaEvent):void
		{
			trace("handleAnswerSelected "+(e.target as Answer).isCorrect);
		}
	}
}