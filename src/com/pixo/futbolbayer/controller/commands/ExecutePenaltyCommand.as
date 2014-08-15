package com.pixo.futbolbayer.controller.commands
{
	import com.pixo.futbolbayer.model.MatchModel;
	import com.pixo.futbolbayer.model.MatchState;
	import com.pixo.futbolbayer.view.events.MatchEvent;
	
	import org.robotlegs.mvcs.Command;
	
	public class ExecutePenaltyCommand extends Command
	{
		[Inject]
		public var matchModel:MatchModel
		
		override public function execute():void
		{
			if (matchModel.state == MatchState.SHOWING_PENALTY)
			{
				matchModel.state = MatchState.PENALTY;
				dispatch(new MatchEvent(MatchEvent.EXECUTE_PENALTY));
			}
		}
	}
}