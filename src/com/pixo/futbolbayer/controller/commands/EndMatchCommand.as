package com.pixo.futbolbayer.controller.commands
{
	import com.pixo.futbolbayer.controller.events.GameEvent;
	import com.pixo.futbolbayer.model.MatchModel;
	import com.pixo.futbolbayer.model.MatchState;
	
	import org.robotlegs.mvcs.Command;

	public class EndMatchCommand extends Command
	{
		[Inject]
		public var matchModel:MatchModel
		
		override public function execute():void
		{
			if (matchModel.state == MatchState.END)
			{
				dispatch(new GameEvent(GameEvent.END));
			}
		}
	}
}