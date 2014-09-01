package com.pixo.futbolbayer.view.match
{
	import com.pixo.futbolbayer.controller.events.GoalEvent;
	import com.pixo.futbolbayer.controller.events.MatchClockEvent;
	import com.pixo.futbolbayer.model.MatchModel;
	import com.pixo.futbolbayer.model.SettingsModel;
	import com.pixo.futbolbayer.view.MatchEnd;
	import com.pixo.futbolbayer.view.events.MatchEvent;
	import com.pixo.futbolbayer.view.events.MovementEvent;
	import com.pixo.futbolbayer.view.events.StartMatchDataEvent;
	
	import common.utils.TimeUtils;
	
	import flash.events.Event;
	
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
			this.eventMap.mapListener(eventDispatcher, GoalEvent.GOAL, handleGoal);
			
			eventMap.mapListener(eventDispatcher, MatchEvent.EXECUTE_PENALTY, hide);
			eventMap.mapListener(eventDispatcher, MatchEvent.EXECUTE_FREE_KICK, hide);
			eventMap.mapListener(eventDispatcher, MatchEvent.RESUME, show);
			eventMap.mapListener(eventDispatcher, MatchEvent.SCORE, show);
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
		
		private function handleGoal(e:GoalEvent):void
		{
			view.setGoals(e.team, e.goals);
		}
		
		private function hide(e:Event):void
		{
			view.visible = false;
		}
		
		private function show(e:Event):void
		{
			view.visible = true;
		}
	}
}