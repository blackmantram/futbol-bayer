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
			this.eventMap.mapListener(eventDispatcher, MatchEvent.READY, handleReady);
			this.eventMap.mapListener(eventDispatcher, MatchEvent.END, handleEnd);
			
			eventMap.mapListener(eventDispatcher, MatchEvent.EXECUTE_PENALTY, hide);
			eventMap.mapListener(eventDispatcher, MatchEvent.EXECUTE_FREE_KICK, hide);
			eventMap.mapListener(eventDispatcher, MatchEvent.RESUME, show);
			eventMap.mapListener(eventDispatcher, MatchEvent.SCORE, show);
		}
		
		private function delay():void
		{
			delayTimer = TimerUtils.startTimer(delayTimer, 2000, handleDelayTimer);
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
			view.showPenalty();
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