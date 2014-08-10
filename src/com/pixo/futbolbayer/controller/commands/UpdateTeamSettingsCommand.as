package com.pixo.futbolbayer.controller.commands
{
	import com.pixo.futbolbayer.model.TeamSettingsModel;
	import com.pixo.futbolbayer.model.datatransferobjects.TeamSettingsDTO;
	import com.pixo.futbolbayer.view.events.SettingsEvent;
	
	import org.robotlegs.mvcs.Command;
	
	public class UpdateTeamSettingsCommand extends Command
	{
		[Inject]
		public var event:SettingsEvent;
		
		[Inject]
		public var teamSettings:TeamSettingsModel;
		
		override public function execute():void
		{
			teamSettings.update(event.settings as TeamSettingsDTO);
		}
	}
}