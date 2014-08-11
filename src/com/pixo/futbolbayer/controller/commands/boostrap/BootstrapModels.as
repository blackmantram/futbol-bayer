package com.pixo.futbolbayer.controller.commands.boostrap
{
	import com.pixo.futbolbayer.model.MatchModel;
	import com.pixo.futbolbayer.model.SettingsModel;
	
	import org.robotlegs.mvcs.Command;
	
	public class BootstrapModels extends Command
	{
		override public function execute():void
		{
			injector.mapSingleton(SettingsModel);
			injector.mapSingleton(MatchModel);
		}
	} 

}