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
			eventMap.mapListener(eventDispatcher, GameEvent.END, handleMatchEnd);
			eventMap.mapListener(eventDispatcher, GameEvent.START, handleMatchstart);
			eventMap.mapListener(eventDispatcher, GameEvent.HELP, handleMatchhelp);
		}
		
		private function handleMatchSettings(e:GameEvent):void
		{
			view.showMatchSettings();
		}
		private function  handleMatchhelp(e:GameEvent):void
		{
			view.showMatchhelp();
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
		
		private function handleMatchEnd(e:GameEvent):void
		{
			view.showMatchEnd();
		}
		
		private function handleMatchstart(e:GameEvent):void
		{
			view.showStart();
		}
	}
}