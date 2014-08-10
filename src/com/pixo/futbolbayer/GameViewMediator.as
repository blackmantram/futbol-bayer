package com.pixo.futbolbayer
{
	import com.pixo.futbolbayer.controller.events.GameEvent;
	
	import org.robotlegs.mvcs.Mediator;

	public class GameViewMediator extends Mediator
	{
		[Inject]
		public var view:GameView;
		
		public function GameViewMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{
			eventMap.mapListener(eventDispatcher, GameEvent.MATCH_SETTINGS, handleMatchSettings);
			eventMap.mapListener(eventDispatcher, GameEvent.TEAM_SETTINGS, handleTeamSettings);
			eventMap.mapListener(eventDispatcher, GameEvent.PREVIEW, handlePreview);
			eventMap.mapListener(eventDispatcher, GameEvent.START_MATCH, handleStartMatch);
		}
		
		private function handleMatchSettings(e:GameEvent):void
		{
			view.showMatchSettings();
		}
		
		private function handleTeamSettings(e:GameEvent):void
		{
			view.showTeamSettings();
		}
		
		private function handlePreview(e:GameEvent):void
		{
			view.showMatchPreview();
		}
		
		private function handleStartMatch(e:GameEvent):void
		{
			view.startMatch();
		}
	}
}