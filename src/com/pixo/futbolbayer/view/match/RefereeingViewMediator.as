package com.pixo.futbolbayer.view.match
{
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class RefereeingViewMediator extends Mediator
	{
		private var startTimer:Timer;
		
		[Inject]
		public var view:RefereeingView;
		
		override public function onRegister():void
		{
			start();
		}
		
		private function start():void
		{	
			startTimer = new Timer(2000);
			startTimer.start();
			startTimer.addEventListener(TimerEvent.TIMER, handleStartTimer);
		}
		
		private function handleStartTimer(e:Event):void
		{
			startTimer.stop();
			view.start();
		}
	}
}