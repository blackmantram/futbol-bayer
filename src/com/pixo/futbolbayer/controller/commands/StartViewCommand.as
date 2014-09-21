package com.pixo.futbolbayer.controller.commands
{
	
	import com.pixo.futbolbayer.GameView;
	
	import flash.display.Sprite;
	
	import org.robotlegs.mvcs.Command;
	
	import assets.skins.GameSkin;
	
	public class StartViewCommand extends Command
	{
		
		override public function execute():void 
		{
			addForeground();
		}
		
		protected function addForeground():void
		{
			contextView.addChild(new GameSkin.ForegroundSkin() as Sprite); 
		}
	}
}