package com.pixo.futbolbayer.controller.commands
{
	import com.pixo.futbolbayer.model.MatchModel;
	import com.pixo.futbolbayer.view.events.MatchEvent;
	import com.pixo.futbolbayer.view.events.MovementEvent;
	
	import org.robotlegs.mvcs.Command;
	
	public class MovementCommand extends Command
	{
		[Inject]
		public var event:MovementEvent;
		
		[Inject]
		public var matchModel:MatchModel;
		
		override public function execute():void
		{
			matchModel.movementsLeft = event.movements;
		}
	}
}