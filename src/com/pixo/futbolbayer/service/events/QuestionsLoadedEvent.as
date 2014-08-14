package com.pixo.futbolbayer.service.events
{
	import flash.events.Event;
	
	public class QuestionsLoadedEvent extends Event
	{
		public static const RECEIVED:String = "TriviaLoadedEvent.resultsReceived";
		
		private var _results:Array;
		public function get results():Array
		{
			return _results;
		}
		
		public function QuestionsLoadedEvent(type:String, results:Array = null, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
			_results = results;
		}
		
		override public function clone():Event
		{
			return new QuestionsLoadedEvent(type, results, bubbles, cancelable)
		}
	}
}