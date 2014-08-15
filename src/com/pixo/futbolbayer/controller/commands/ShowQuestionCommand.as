package com.pixo.futbolbayer.controller.commands
{
	import com.pixo.futbolbayer.model.MatchModel;
	import com.pixo.futbolbayer.model.MatchState;
	import com.pixo.futbolbayer.view.events.MatchEvent;
	
	import org.robotlegs.mvcs.Command;
	
	public class ShowQuestionCommand extends Command
	{
		[Inject]
		public var matchModel:MatchModel;
		
		override public function execute():void
		{
			if (matchModel.state == MatchState.RUNNING)
			{
				var evt:MatchEvent = new MatchEvent(MatchEvent.SHOW_QUESTION);
				dispatch(evt);	
			}
		}
	}
}