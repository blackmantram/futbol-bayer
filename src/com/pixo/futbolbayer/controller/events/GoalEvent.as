package com.pixo.futbolbayer.controller.events
{
	import flash.events.Event;
	
	public class GoalEvent extends Event
	{
		public static const GOAL:String = "GoalEvent.goal";
		
		public var team:int;
		public var goals:int;
		
		public function GoalEvent(type:String, team:int, goals:int, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.team = team;
			this.goals = goals;
			super(type, bubbles, cancelable);
		}
		
		override public function clone() : Event 
		{
			return new GoalEvent(type, team, goals, bubbles, cancelable);
		}
	}
}