package com.pixo.futbolbayer.view.trivia
{
	import com.pixo.futbolbayer.model.MatchModel;
	import com.pixo.futbolbayer.service.trivia.IQuestionsParser;
	import com.pixo.futbolbayer.service.trivia.QuestionsParser;
	import com.pixo.futbolbayer.view.events.MatchEvent;
	import com.pixo.futbolbayer.view.trivia.evemts.TriviaEvent;
	
	import common.utils.TimerUtils;
	
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.robotlegs.mvcs.Mediator;

	public class TriviaViewMediator extends Mediator
	{
		[Inject]
		public var view:TriviaView;
		
		[Inject]
		public var questionsParser:IQuestionsParser;
		
		private var delayTimer:Timer;
		
		private var wasLastAnswerCorrect:Boolean;
		
		private var isSelectingAnswer:Boolean = false;
		
		override public function onRegister():void
		{
			view.visible = false;
			eventMap.mapListener(eventDispatcher, MatchEvent.SHOW_QUESTION, handleShowQuestion );
			eventMap.mapListener(view.answerAText, TriviaEvent.SELECTED_ANSWER, handleAnswerSelected);
			eventMap.mapListener(view.answerBText, TriviaEvent.SELECTED_ANSWER, handleAnswerSelected);
			eventMap.mapListener(view.answerCText, TriviaEvent.SELECTED_ANSWER, handleAnswerSelected);
			eventMap.mapListener(view.answerDText, TriviaEvent.SELECTED_ANSWER, handleAnswerSelected);
			this.eventMap.mapListener(eventDispatcher, MatchEvent.END, handleEnd);
		}
		
		private function handleShowQuestion(e:MatchEvent):void
		{
			isSelectingAnswer = true;
			view.visible = true;
			view.show();
			view.showQuestion(questionsParser.getQuestion());
		}
		
		private function handleAnswerSelected(e:TriviaEvent):void
		{
			if (isSelectingAnswer)
			{
				isSelectingAnswer = false;
				wasLastAnswerCorrect = e.isCorrect;
				validateAnswer(wasLastAnswerCorrect);
				startDelayTime();	
			}
		}
		
		private function validateAnswer(isCorrect:Boolean):void
		{
			if (isCorrect)
				view.showRightIndicator();
			else
				view.showWrongIndicator();
		}
		
		private function startDelayTime():void
		{
			delayTimer = TimerUtils.startTimer(2000, handleDelayComplete);
		}
		
		private function handleDelayComplete(e:TimerEvent):void
		{
			TimerUtils.stopTimer(delayTimer, handleDelayComplete);
			view.hide();
			dispatch(new TriviaEvent(TriviaEvent.SELECTED_ANSWER, wasLastAnswerCorrect));
		}
		
		private function handleEnd(e:MatchEvent):void
		{
			view.hide();
			eventMap.unmapListeners();
		}
	}
}