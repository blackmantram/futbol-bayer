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
				checkCards(matchModel.tellPlayerOff());
				matchModel.changeTurn();
				dispatchEvent(MatchEvent.TURN);
			}
		}
		
		private function checkCards(cardsNumber:int):void
		{
			dispatchEvent(MatchEvent.YELLOW_CARD);
			if (cardsNumber == 4)
			{
				matchModel.state = MatchState.SHOWING_PENALTY;
				dispatchEvent(MatchEvent.PENALTY);
			}
		}
		
		private function dispatchEvent(type:String):void
		{
			var event:MatchEvent = new MatchEvent(type);
			event.currentTurn = matchModel.currentTurn;
			dispatch(event);
		}
	}
}