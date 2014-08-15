package com.pixo.futbolbayer.view.match
{
	import com.pixo.futbolbayer.view.events.MatchEvent;
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
			this.eventMap.mapListener(view, RefereeingViewEvent.INTRO_COMPLETED, handleStartComplete);
		}
		
		private function delay():void
		{
			delayTimer = TimerUtils.startTimer(delayTimer, 2000, handleDelayTimer);
		}
		
		private function handleDelayTimer(e:Event):void
		{
			TimerUtils.stopTimer(delayTimer, handleDelayTimer);
			view.playIntro();
		}
		
		private function handleStartComplete(e:RefereeingViewEvent):void
		{
			this.dispatch(new MatchEvent(MatchEvent.START));
		}
	}
}