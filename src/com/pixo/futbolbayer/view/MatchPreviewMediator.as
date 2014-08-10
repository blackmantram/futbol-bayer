package com.pixo.futbolbayer.view
{
	import com.pixo.futbolbayer.controller.events.GameEvent;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class MatchPreviewMediator extends BaseMatchMediator
	{
		[Inject]
		public var view:MatchPreview;
		
		override public function onRegister():void
		{
			this.eventMap.mapListener(view, Event.DISPLAYING, handleViewShown);
			this.eventMap.mapListener(view.backButton, MouseEvent.CLICK, handleGoToTeamSetting);
			this.eventMap.mapListener(view.startButton, MouseEvent.CLICK, handleStartMatch);
		}
		
		private function handleViewShown(e:Event):void
		{
			view.setPreviewData(createPreviewDTO());
		}
		
		private function handleGoToTeamSetting(e:MouseEvent):void
		{
			dispatch(new GameEvent(GameEvent.TEAM_SETTINGS));
		}
		
		private function handleStartMatch(e:MouseEvent):void
		{
			dispatch(new GameEvent(GameEvent.START_MATCH));
		}
	}
}