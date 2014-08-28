package com.pixo.futbolbayer.controller.commands
{
	import com.pixo.futbolbayer.model.MatchModel;
	import com.pixo.futbolbayer.model.MatchState;
	import com.pixo.futbolbayer.view.events.MatchEvent;
	
	import org.robotlegs.mvcs.Command;
	
	public class ExecuteFreeKickCommand extends Command
	{
		[Inject]
		public var matchModel:MatchModel;
		
		override public function execute():void
		{
			if(matchModel.state == MatchState.FREE_KICK)
			{
				matchModel.state = MatchState.SHOWING_FREE_KICK;
				dispatch(new MatchEvent(MatchEvent.EXECUTE_FREE_KICK));
			}
		}
	}
}