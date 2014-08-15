package com.pixo.futbolbayer.controller.commands
{
	import com.pixo.futbolbayer.model.MatchModel;
	import com.pixo.futbolbayer.model.MatchSettings;
	import com.pixo.futbolbayer.model.MatchState;
	import com.pixo.futbolbayer.model.SettingsModel;
	import com.pixo.futbolbayer.view.events.MatchEvent;
	
	import org.robotlegs.mvcs.Command;

	public class StartMatchCommand extends Command
	{
		[Inject]
		public var settingsModel:SettingsModel;
		
		[Inject]
		public var matchModel:MatchModel
		
		override public function execute():void
		{
			if (matchModel.state == MatchState.READY_TO_START)
			{
				matchModel.state = MatchState.RUNNING;
				matchModel.start(settingsModel.matchSettings.time);
				dispatch(new MatchEvent(MatchEvent.START));
			}
		}
	}
}