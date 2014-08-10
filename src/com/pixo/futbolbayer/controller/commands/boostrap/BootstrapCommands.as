package com.pixo.futbolbayer.controller.commands.boostrap
{
	import com.pixo.futbolbayer.controller.commands.UpdateMatchSettingsCommant;
	import com.pixo.futbolbayer.controller.commands.UpdateTeamSettingsCommand;
	import com.pixo.futbolbayer.controller.events.GameEvent;
	import com.pixo.futbolbayer.view.events.SettingsEvent;
	
	import org.robotlegs.mvcs.Command;
	
	public class BootstrapCommands extends Command
	{
		override public function execute():void
		{
			commandMap.mapEvent(SettingsEvent.MATCH_SETTINGS_CHANGED, UpdateMatchSettingsCommant, SettingsEvent);
			commandMap.mapEvent(SettingsEvent.TEAM_SETTINGS_CHANGED, UpdateTeamSettingsCommand, SettingsEvent);
		}
	}
}