package com.pixo.futbolbayer
{
	import com.pixo.futbolbayer.controller.commands.StartGameCommand;
	import com.pixo.futbolbayer.controller.commands.boostrap.BootstrapGameStartup;
	
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;
	
	public class GameContext extends Context
	{
		public function GameContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void
		{
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, BootstrapGameStartup, ContextEvent, true);
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, StartGameCommand, ContextEvent, true);
			super.startup();
		}
	}
}