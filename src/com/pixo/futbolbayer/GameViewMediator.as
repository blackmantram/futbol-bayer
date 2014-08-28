package com.pixo.futbolbayer
{
	import com.pixo.futbolbayer.controller.events.GameEvent;
	import com.pixo.futbolbayer.view.GameSoundIds;
	import com.pixo.futbolbayer.view.events.SoundEvent;
	
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
			eventMap.mapListener(eventDispatcher, GameEvent.GOTO_MATCH, handleGoToMatch);
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
		
		private function handleGoToMatch(e:GameEvent):void
		{
			view.showMatch();
		}
	}
}