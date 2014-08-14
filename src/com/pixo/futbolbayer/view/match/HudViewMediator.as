package com.pixo.futbolbayer.view.match
{
	import com.pixo.futbolbayer.model.MatchModel;
	import com.pixo.futbolbayer.model.SettingsModel;
	import com.pixo.futbolbayer.view.events.MatchProgressEvent;
	import com.pixo.futbolbayer.view.events.StartMatchDataEvent;
	
	import org.robotlegs.mvcs.Mediator;

	public class HudViewMediator extends Mediator
	{
		[Inject]
		public var view:HudView;
		
		[Inject]
		public var settingsModel:SettingsModel;
		
		[Inject]
		public var matchModel:MatchModel;
		
		override public function onRegister():void
		{
			setInitialData();
			this.eventMap.mapListener(eventDispatcher, MatchProgressEvent.MOVEMENT, handleMovement);
			this.eventMap.mapListener(eventDispatcher, MatchProgressEvent.TURN, handleMovement);
		}
		
		private function setInitialData():void
		{
			view.setData(settingsModel.createHudDTO());
		}
		
		private function handleMovement(e:MatchProgressEvent):void
		{
			view.setMovements(matchModel.movementsLeft);
		}
		
		private function handleTurn(e:MatchProgressEvent):void
		{
			view.setCurrentTurn(matchModel.currentTurn);
		}
	}
}