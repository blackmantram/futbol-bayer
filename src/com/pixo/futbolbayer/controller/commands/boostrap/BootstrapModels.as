package com.pixo.futbolbayer.controller.commands.boostrap
{
	import com.pixo.futbolbayer.model.MatchSettingsModel;
	import com.pixo.futbolbayer.model.TeamSettingsModel;
	
	import org.robotlegs.mvcs.Command;
	
	public class BootstrapModels extends Command
	{
		override public function execute():void
		{
			injector.mapSingleton(MatchSettingsModel);
			injector.mapSingleton(TeamSettingsModel);
		}
	} 

}