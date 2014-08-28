package com.pixo.futbolbayer.model
{
	import com.pixo.futbolbayer.controller.events.MatchClockEvent;
	import com.pixo.futbolbayer.view.events.MatchEvent;
	
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
		
		public function reset():void
		{
			teamsCards = [0, 0];
			state = MatchState.READY_TO_START;
		}
		
		private function handleTimer(e:TimerEvent):void
		{
			currentTime--;
			if (currentTime>0)
				this.dispatch(new MatchClockEvent(MatchClockEvent.TICK, currentTime));
			else
			{
				this.state = MatchState.END;
				clockTimer.stop();
				this.dispatch(new MatchEvent(MatchEvent.END));
			}
		}
		
		public function start(setTime:int):void
		{
			currentTime = setTime;
			this.clockTimer.start();
		}
		
		public function pause():void
		{
			this.clockTimer.stop();
		}
		
		public function changeTurn():void
		{
			currentTurn = (currentTurn % 2) + 1;
			dispatchEvent(MatchEvent.TURN);
		}
		
		public function tellPlayerOff():void
		{
			teamsCards[currentTurn-1]++;
			dispatchEvent(MatchEvent.YELLOW_CARD);
			checkCards();
		}
		
		public function score():int
		{
			changeTurn();
			teamsGoals[currentTurn-1]++;
			return teamsGoals[currentTurn-1];
		}
		
		private function checkCards():void
		{
			if (teamsCards[currentTurn-1] == 4)
			{
				state = MatchState.SHOWING_PENALTY;
				dispatchEvent(MatchEvent.PENALTY);
			}
		}
		
		private function dispatchEvent(type:String):void
		{
			var event:MatchEvent = new MatchEvent(type);
			event.currentTurn = currentTurn;
			dispatch(event);
		}
	}
}