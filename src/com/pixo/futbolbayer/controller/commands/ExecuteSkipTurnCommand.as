package com.pixo.futbolbayer.controller.commands
{
	import com.pixo.futbolbayer.model.MatchModel;
	import com.pixo.futbolbayer.model.MatchState;
	import com.pixo.futbolbayer.view.events.MatchEvent;
	
	import org.robotlegs.mvcs.Command;
	
	public class ExecuteSkipTurnCommand extends Command
	{
		[Inject]
		public var matchModel:MatchModel;
		
		override public function execute():void
		{
			if(matchModel.state == MatchState.OFF_SIDE || matchModel.state == MatchState.HAND_BALL)
			{
				matchModel.changeTurn();
				matchModel.state = MatchState.RUNNING;
				dispatch(new MatchEvent(MatchEvent.STEP_FINISHED));
			}
		}
	}
}