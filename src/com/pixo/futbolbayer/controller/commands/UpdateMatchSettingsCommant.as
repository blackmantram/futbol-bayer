package com.pixo.futbolbayer.controller.commands
{
	import com.pixo.futbolbayer.model.MatchSettingsModel;
	import com.pixo.futbolbayer.model.datatransferobjects.MatchSettingsDTO;
	import com.pixo.futbolbayer.view.events.SettingsEvent;
	
	import org.robotlegs.mvcs.Command;
	
	public class UpdateMatchSettingsCommant extends Command
	{
		[Inject]
		public var event:SettingsEvent;
		
		[Inject]
		public var matchSettings:MatchSettingsModel;
		
		override public function execute():void
		{
			matchSettings.update(event.settings as MatchSettingsDTO);
		}
	}
}