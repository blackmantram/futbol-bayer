package com.pixo.futbolbayer.controller.commands
{
	import com.pixo.futbolbayer.model.MatchModel;
	import com.pixo.futbolbayer.model.SettingsModel;
	
	import org.robotlegs.mvcs.Command;
	
	public class PauseCommand extends Command
	{
		[Inject]
		public var matchModel:MatchModel
		
		[Inject]
		public var settingsModel:SettingsModel;
		
		override public function execute():void
		{
			matchModel.pause();
			settingsModel.matchSettings.time = matchModel.currentTime;
		}
	}
}