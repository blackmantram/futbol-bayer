package com.pixo.futbolbayer.controller.commands
{
	import com.pixo.futbolbayer.model.MatchModel;
	import com.pixo.futbolbayer.model.MatchState;
	import com.pixo.futbolbayer.view.events.SpecialActionEvent;
	
	import org.robotlegs.mvcs.Command;
	
	public class FinishSpecialActionCommand extends Command
	{
		[Inject]
		public var matchModel:MatchModel;
		
		override public function execute():void
		{
			matchModel.state = MatchState.RUNNING;
			matchModel.changeTurn();
			dispatch(new SpecialActionEvent(SpecialActionEvent.SPECIAL_ACTION_COMPLETED));
		}
	}
}