package com.pixo.futbolbayer.view
{
	import com.pixo.futbolbayer.controller.events.GameEvent;
	import com.pixo.futbolbayer.model.MatchModel;
	import com.pixo.futbolbayer.model.SettingsModel;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class MatchEndMediator extends Mediator
	{
		[Inject]
		public var view:MatchEnd;
		
		[Inject]
		public var settingsModel:SettingsModel;
		
		[Inject]
		public var matchModel:MatchModel;
		
		override public function onRegister():void
		{
			view.setData(settingsModel.createPreviewDTO(), matchModel.teamsGoals[0], matchModel.teamsGoals[1]);
			eventMap.mapListener(view.startButton, MouseEvent.CLICK, handleRestartGame);
		}
		
		private function handleRestartGame(e:Event):void
		{
			dispatch(new GameEvent(GameEvent.RESTART));
		}
	}
}