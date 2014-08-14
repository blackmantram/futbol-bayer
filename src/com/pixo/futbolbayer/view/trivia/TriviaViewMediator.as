package com.pixo.futbolbayer.view.trivia
{
	import com.pixo.futbolbayer.service.trivia.IQuestionsParser;
	import com.pixo.futbolbayer.service.trivia.QuestionsParser;
	
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
		}
	}
}