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
		public var teamsGoals:Array;
		public var teamsCards:Array;
		public var movementsLeft:int;
		public var currentTurn:int;
		public var state:String;
		private var clockTimer:Timer = new Timer(1000);
		
		public function MatchModel() 
		{
			super();
			this.clockTimer.addEventListener(TimerEvent.TIMER, handleTimer);
			currentTurn = 1;
			teamsGoals = [0, 0];
			teamsCards = [0, 0];
			state = MatchState.READY_TO_START;
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
		
		public function tellPlayerOff():int
		{
			teamsCards[currentTurn-1]++;
			return teamsCards[currentTurn-1];
		}
	}
}