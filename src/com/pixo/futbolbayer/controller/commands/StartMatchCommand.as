package com.pixo.futbolbayer.controller.commands
{
	import com.pixo.futbolbayer.model.MatchModel;
	import com.pixo.futbolbayer.model.MatchSettings;
	import com.pixo.futbolbayer.model.SettingsModel;
	
	import org.robotlegs.mvcs.Command;

	public class StartMatchCommand extends Command
	{
		[Inject]
		public var settingsModel:SettingsModel;
		
		[Inject]
		public var matchModel:MatchModel
		
		override public function execute():void
		{
			matchModel.start(settingsModel.matchSettings.time);
		}
	}
}