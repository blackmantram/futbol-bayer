package com.pixo.futbolbayer.view
{
	import com.pixo.futbolbayer.controller.events.GameEvent;
	import com.pixo.futbolbayer.model.SettingsModel;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class MatchPreviewMediator extends Mediator
	{
		[Inject]
		public var view:MatchPreview;
		
		[Inject]
		public var settingsModel:SettingsModel;
		
		override public function onRegister():void
		{
			this.eventMap.mapListener(view, Event.DISPLAYING, handleViewShown);
			this.eventMap.mapListener(view.backButton, MouseEvent.CLICK, handleGoToTeamSetting);
			this.eventMap.mapListener(view.startButton, MouseEvent.CLICK, handleGoToMatch);
			view.setPreviewData(settingsModel.createPreviewDTO());
		}
		
		private function handleViewShown(e:Event):void
		{
			view.setPreviewData(settingsModel.createPreviewDTO());
		}
		
		private function handleGoToTeamSetting(e:MouseEvent):void
		{
			dispatch(new GameEvent(GameEvent.TEAM_SETTINGS));
		}
		
		private function handleGoToMatch(e:MouseEvent):void
		{
			dispatch(new GameEvent(GameEvent.GOTO_MATCH));
		}
	}
}