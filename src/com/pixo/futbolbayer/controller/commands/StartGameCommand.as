package com.pixo.futbolbayer.controller.commands
{
	
	import com.pixo.futbolbayer.controller.events.GameEvent;
	
	import org.robotlegs.mvcs.Command;
	
	public class StartGameCommand extends Command
	{
		
		override public function execute():void 
		{
			var evt:GameEvent = new GameEvent(GameEvent.GAME_STARTED);
			dispatch(evt);
		} 
	}
}