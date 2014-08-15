package com.pixo.futbolbayer.view.match
{
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
		
		override public function onRegister():void
		{
			delay();
			this.eventMap.mapListener(view, RefereeingViewEvent.POPUP_COMPLETED, handlePopUpComplete);
			this.eventMap.mapListener(eventDispatcher, MatchEvent.YELLOW_CARD, handleYellowCard);
			this.eventMap.mapListener(eventDispatcher, MatchEvent.PENALTY, handlePenalty);
		}
		
		private function delay():void
		{
			delayTimer = TimerUtils.startTimer(delayTimer, 2000, handleDelayTimer);
		}
		
		private function handleDelayTimer(e:Event):void
		{
			TimerUtils.stopTimer(delayTimer, handleDelayTimer);
			view.showStart();
		}
		
		private function handlePopUpComplete(e:RefereeingViewEvent):void
		{
			this.dispatch(new RefereeingEvent(RefereeingEvent.REFEREE));
		}
		
		private function handlePenalty(e:MatchEvent):void
		{
			view.showPenalti();
		}
		
		private function handleYellowCard(e:MatchEvent):void
		{
			view.showYellowCard(e.currentTurn);
		}
	}
}