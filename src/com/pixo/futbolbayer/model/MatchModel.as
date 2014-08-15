package com.pixo.futbolbayer.model
{
	import com.pixo.futbolbayer.controller.events.MatchClockEvent;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.hamcrest.mxml.collection.InArray;
	import org.osmf.events.TimeEvent;
	import org.robotlegs.mvcs.Actor;

	public class MatchModel extends Actor
	{
		public var currentTime:int;
		public var team1Goals:int;
		public var team2Goals:int;
		public var movementsLeft:int;
		public var currentTurn:int;
		
		private var clockTimer:Timer = new Timer(1000);
		
		public function MatchModel() 
		{
			super();
			this.clockTimer.addEventListener(TimerEvent.TIMER, handleTimer);
		}
		
		private function handleTimer(e:TimerEvent):void
		{
			currentTime--;
			this.dispatch(new MatchClockEvent(MatchClockEvent.TICK, currentTime));
		}
		
		public function start(setTime:int):void
		{
			currentTime = setTime;
			this.clockTimer.start();
		}
		
		public function changeTurn():void
		{
			currentTurn = (currentTurn % 2) + 1;
		}
	}
}