package com.pixo.futbolbayer.controller.commands
{
	import com.pixo.futbolbayer.model.MatchModel;
	import com.pixo.futbolbayer.model.MatchState;
	import com.pixo.futbolbayer.view.events.MatchEvent;
	import com.pixo.futbolbayer.view.trivia.evemts.TriviaEvent;
	
	import org.robotlegs.mvcs.Command;

	public class CheckAnswerCommand extends Command
	{
		[Inject]
		public var event:TriviaEvent;
		
		[Inject]
		public var matchModel:MatchModel;
		
		override public function execute():void
		{
			if(!event.isCorrect)
			{
				matchModel.state = MatchState.SHOWING_YELLOW_CARD;
				matchModel.tellPlayerOff()
				matchModel.changeTurn();
			}
		}
	}
}