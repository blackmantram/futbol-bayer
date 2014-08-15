package com.pixo.futbolbayer.controller.commands
{
	import com.pixo.futbolbayer.controller.events.GoalEvent;
	import com.pixo.futbolbayer.model.MatchModel;
	import com.pixo.futbolbayer.model.MatchState;
	import com.pixo.futbolbayer.view.events.MatchEvent;
	
	import org.robotlegs.mvcs.Command;
	
	public class ScoreCommand extends Command
	{
		[Inject]
		public var event:MatchEvent;
		
		[Inject]
		public var matchModel:MatchModel;
		
		override public function execute():void
		{
			matchModel.state = MatchState.SCORED;
			var goals:int = matchModel.score();
			dispatch(new GoalEvent(GoalEvent.GOAL, matchModel.currentTurn, goals));
		}
	}
}