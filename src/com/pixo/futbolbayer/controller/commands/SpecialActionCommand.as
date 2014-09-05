package com.pixo.futbolbayer.controller.commands
{
	import com.pixo.futbolbayer.model.MatchModel;
	import com.pixo.futbolbayer.view.events.MatchEvent;
	import com.pixo.futbolbayer.view.events.SpecialActionEvent;
	
	import org.robotlegs.mvcs.Command;
	
	public class SpecialActionCommand extends Command
	{
		[Inject]
		public var event:SpecialActionEvent;
		
		[Inject]
		public var matchModel:MatchModel;
		
		override public function execute():void
		{
			if(matchModel.currentTurn == event.playerIndex)
			{
				dispatch(new SpecialActionEvent(SpecialActionEvent.SPECIAL_ACTION_STARTED));
			}
			else
			{
				dispatch(new SpecialActionEvent(SpecialActionEvent.SPECIAL_ACTION_COMPLETED));
			}
		}
	}
}