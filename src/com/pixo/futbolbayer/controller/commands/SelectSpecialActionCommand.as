package com.pixo.futbolbayer.controller.commands
{
	import com.pixo.futbolbayer.model.MatchModel;
	import com.pixo.futbolbayer.model.MatchState;
	import com.pixo.futbolbayer.view.events.MatchEvent;
	import com.pixo.futbolbayer.view.events.RefereeingEvent;
	
	import common.utils.MathUtils;
	
	import org.robotlegs.mvcs.Command;

	public class SelectSpecialActionCommand extends Command
	{
		[Inject]
		public var matchModel:MatchModel;
		
		override public function execute():void
		{
			var specialAction:int = MathUtils.randomRange(1, 4);
			executeSpecialAction(specialAction);
		}
		
		private function executeSpecialAction(specialActionIndex:int):void
		{
			switch(specialActionIndex)
			{
				case 1:
					matchModel.state = MatchState.OFF_SIDE;
					dispatch(new MatchEvent(MatchEvent.OFF_SIDE));
					break;
				case 2:
					matchModel.state = MatchState.FAULT;
					dispatch(new MatchEvent(MatchEvent.FAULT));
					break;
				case 3:
					matchModel.state = MatchState.HAND_BALL;
					dispatch(new MatchEvent(MatchEvent.HAND_BALL));
					break;
				case 4:
					matchModel.state = MatchState.FREE_KICK;
					dispatch(new MatchEvent(MatchEvent.FREE_KICK));
					break;
			}
		}
	}
}