package com.pixo.futbolbayer.controller.commands
{
	import com.pixo.futbolbayer.model.SettingsModel;
	import com.pixo.futbolbayer.model.datatransferobjects.MatchSettingsDTO;
	import com.pixo.futbolbayer.view.events.SettingsEvent;
	
	import org.robotlegs.mvcs.Command;
	
	public class UpdateMatchSettingsCommant extends Command
	{
		[Inject]
		public var event:SettingsEvent;
		
		[Inject]
		public var settingModel:SettingsModel;
		
		override public function execute():void
		{
			settingModel.matchSettings.update(event.settings as MatchSettingsDTO);
		}
	}
}