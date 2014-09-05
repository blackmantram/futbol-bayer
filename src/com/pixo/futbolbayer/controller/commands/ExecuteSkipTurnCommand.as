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
			if(matchModel.state == MatchState.OFF_SIDE)
			{
				dispatch(new MatchEvent(MatchEvent.SHOWING_OFF_SIDE));
			}
			if (matchModel.state == MatchState.HAND_BALL)
			{
				dispatch(new MatchEvent(MatchEvent.SHOWING_HAND_BALL));
			}
		}
	}
}