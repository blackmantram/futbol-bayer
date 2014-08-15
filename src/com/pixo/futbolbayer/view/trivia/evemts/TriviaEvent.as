package com.pixo.futbolbayer.view.trivia.evemts
{
	import flash.events.Event;
	
	public class TriviaEvent extends Event
	{
		public static const SELECTED_ANSWER:String = "TriviaEvent.SelectedAnswr";
		
		public var isCorrect:Boolean;
		
		public function TriviaEvent(type:String, isCorrent:Boolean, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.isCorrect = isCorrent;
			super(type, bubbles, cancelable);
		}
	}
}