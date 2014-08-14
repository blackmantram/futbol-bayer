package com.pixo.futbolbayer.view.trivia.evemts
{
	import com.pixo.futbolbayer.view.trivia.Answer;
	
	import flash.events.Event;
	
	public class TriviaEvent extends Event
	{
		public static const SELECTED_ANSWER:String = "TriviaEvent.SelectedAnswr";
		
		public var answer:Answer;
		
		public function TriviaEvent(type:String, answer:Answer, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.answer = answer;
			super(type, bubbles, cancelable);
		}
	}
}