package com.pixo.futbolbayer.controller.commands.boostrap
{
	import com.pixo.futbolbayer.controller.commands.StartViewCommand;
	import com.pixo.futbolbayer.controller.events.GameEvent;
	
	import org.robotlegs.mvcs.Command;

	public class BootstrapGameStartup extends Command
	{
	
		override public function execute():void
		{
			commandMap.mapEvent(GameEvent.GAME_STARTED, StartViewCommand, GameEvent, true);
			commandMap.mapEvent(GameEvent.GAME_STARTED, BootstrapModels, GameEvent, true);
			commandMap.mapEvent(GameEvent.GAME_STARTED, BootstrapCommands, GameEvent, true);
			commandMap.mapEvent(GameEvent.GAME_STARTED, BootstrapServices, GameEvent, true);
			commandMap.mapEvent(GameEvent.GAME_STARTED, BootstrapViewMediators, GameEvent, true);
		}
	
	}

}