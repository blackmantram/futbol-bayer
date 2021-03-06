package com.pixo.futbolbayer.controller.commands
{
	import com.pixo.futbolbayer.model.MatchModel;
	import com.pixo.futbolbayer.model.MatchState;
	import com.pixo.futbolbayer.view.events.MatchEvent;
	import com.pixo.futbolbayer.view.events.ReverseEvent;
	
	import org.robotlegs.mvcs.Command;
	
	public class ExecuteFaultCommand extends Command
	{
		[Inject]
		public var matchModel:MatchModel;
		
		override public function execute():void
		{
			if(matchModel.state == MatchState.FAULT)
			{
				dispatch(new MatchEvent(MatchEvent.SHOWING_FAULT));
			}
		}
	}
}