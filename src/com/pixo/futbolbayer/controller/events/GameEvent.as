package com.pixo.futbolbayer.controller.events 
{
	
	import flash.events.Event;
	
	public class GameEvent extends Event {
		
		public static const GAME_STARTED:String = "GameEvent.gameStarted";
		public static const MATCH_SETTINGS:String = "GameEvent.matchSettings";
		public static const TEAM_SETTINGS:String = "GameEvent.teamSettings";
		public static const PREVIEW:String = "GameEvent.preview";
		public static const GOTO_MATCH:String = "GameEvent.gotoMatch";
		public static const END:String = "GameEvent.end";
		public static const start:String = "GameEvent.start";
		public static const HELP:String = "GameEvent.help";
				
		/**
		 *	@constructor
		 */
		public function GameEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false ){
			super(type, bubbles, cancelable);		
		}
		
		override public function clone() : Event {
			return new GameEvent(type, bubbles, cancelable);
		}
		
	}
}
