package com.pixo.futbolbayer.view.match
{
	import com.pixo.futbolbayer.controller.events.MatchClockEvent;
	import com.pixo.futbolbayer.model.MatchModel;
	import com.pixo.futbolbayer.model.SettingsModel;
	import com.pixo.futbolbayer.view.events.MatchEvent;
	import com.pixo.futbolbayer.view.events.MovementEvent;
	import com.pixo.futbolbayer.view.events.StartMatchDataEvent;
	
	import common.utils.TimeUtils;
	
	import org.robotlegs.mvcs.Mediator;

	public class HudViewMediator extends Mediator
	{
		[Inject]
		public var view:HudView;
		
		[Inject]
		public var settingsModel:SettingsModel;
		
		override public function onRegister():void
		{
			setInitialData();
			this.eventMap.mapListener(eventDispatcher, MovementEvent.MOVEMENT, handleMovement);
			this.eventMap.mapListener(eventDispatcher, MatchEvent.TURN, handleTurn);
			this.eventMap.mapListener(eventDispatcher, MatchClockEvent.TICK, handleTick);
		}
		
		private function setInitialData():void
		{
			view.setData(settingsModel.createHudDTO());
		}
		
		private function handleMovement(e:MovementEvent):void
		{
			view.setMovements(e.movements);
		}
		
		private function handleTurn(e:MatchEvent):void
		{
			view.setCurrentTurn(e.currentTurn);
		}
		
		private function handleTick(e:MatchClockEvent):void
		{
			view.setCurrentTime(TimeUtils.convertToTimeStamp(e.currentTime));
		}
	}
}