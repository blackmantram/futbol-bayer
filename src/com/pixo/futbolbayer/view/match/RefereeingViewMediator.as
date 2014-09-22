package com.pixo.futbolbayer.view.match
{
	import com.pixo.futbolbayer.model.SettingsModel;
	import com.pixo.futbolbayer.view.events.MatchEvent;
	import com.pixo.futbolbayer.view.events.RefereeingEvent;
	import com.pixo.futbolbayer.view.events.RefereeingViewEvent;
	
	import common.utils.TimerUtils;
	
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class RefereeingViewMediator extends Mediator
	{
		private var delayTimer:Timer;
		
		[Inject]
		public var view:RefereeingView;
		
		[Inject]
		public var settingsModel:SettingsModel;
		
		override public function onRegister():void
		{
			view.setCharacter(settingsModel.getRefereeAsset());
			delay();
			eventMap.mapListener(view, RefereeingViewEvent.POPUP_COMPLETED, handlePopUpComplete);
			eventMap.mapListener(eventDispatcher, MatchEvent.YELLOW_CARD, handleYellowCard);
			eventMap.mapListener(eventDispatcher, MatchEvent.PENALTY, handlePenalty);
			eventMap.mapListener(eventDispatcher, MatchEvent.READY, handleReady);
			eventMap.mapListener(eventDispatcher, MatchEvent.END, handleEnd);
			eventMap.mapListener(eventDispatcher, MatchEvent.SHOWING_HAND_BALL, handleHandBall);
			eventMap.mapListener(eventDispatcher, MatchEvent.SHOWING_OFF_SIDE, handleOffSide);
			eventMap.mapListener(eventDispatcher, MatchEvent.SHOWING_FAULT, handleFault);
			eventMap.mapListener(eventDispatcher, MatchEvent.SHOWING_FREE_KICK, handleFreeKick);
			
			eventMap.mapListener(eventDispatcher, MatchEvent.EXECUTE_PENALTY, hide);
			eventMap.mapListener(eventDispatcher, MatchEvent.EXECUTE_FREE_KICK, hide);
			eventMap.mapListener(eventDispatcher, MatchEvent.RESUME, show);
			eventMap.mapListener(eventDispatcher, MatchEvent.SCORE, show);
		}
		
		private function delay():void
		{
			delayTimer = TimerUtils.startTimer(2000, handleDelayTimer);
		}
		
		private function handleDelayTimer(e:Event):void
		{
			dispatch(new RefereeingEvent(RefereeingEvent.SHOW_REFEREE));
			TimerUtils.stopTimer(delayTimer, handleDelayTimer);
			view.showStart();
		}
		
		private function handlePopUpComplete(e:RefereeingViewEvent):void
		{
			this.dispatch(new RefereeingEvent(RefereeingEvent.REFEREE));
		}
		
		private function handlePenalty(e:MatchEvent):void
		{
			dispatch(new RefereeingEvent(RefereeingEvent.SHOW_REFEREE));
			view.showPenalty(e.currentTurn);
		}
		
		private function handleYellowCard(e:MatchEvent):void
		{
			dispatch(new RefereeingEvent(RefereeingEvent.SHOW_REFEREE));
			view.showYellowCard(e.currentTurn);
		}
		
		private function handleEnd(e:MatchEvent):void
		{
			dispatch(new RefereeingEvent(RefereeingEvent.SHOW_REFEREE));
			view.showEnd();
		}
		
		private function handleHandBall(e:MatchEvent):void
		{
			dispatch(new RefereeingEvent(RefereeingEvent.SHOW_REFEREE));
			view.showHandBall();
		}
		
		private function handleOffSide(e:MatchEvent):void
		{
			dispatch(new RefereeingEvent(RefereeingEvent.SHOW_REFEREE));
			view.showOffSide();
		}
		
		private function handleFault(e:MatchEvent):void
		{
			dispatch(new RefereeingEvent(RefereeingEvent.SHOW_REFEREE));
			view.showFault();
		}
		
		private function handleFreeKick(e:MatchEvent):void
		{
			dispatch(new RefereeingEvent(RefereeingEvent.SHOW_REFEREE));
			view.showFreeKick();
		}
		
		private function handleReady(e:Event):void
		{
			view.reset();
			delay();
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