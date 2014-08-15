package com.pixo.futbolbayer.controller.commands
{
	import com.pixo.futbolbayer.view.events.MatchEvent;
	import com.pixo.futbolbayer.view.trivia.evemts.TriviaEvent;
	
	import org.robotlegs.mvcs.Command;
	
	public class NextStepCommand extends Command
	{
		[Inject]
		public var event:TriviaEvent;
		
		override public function execute():void
		{
			if(event.isCorrect)
				dispatch(new MatchEvent(MatchEvent.NEXT_STEP));
			else
				dispatch(new MatchEvent(MatchEvent.SHOW_QUESTION));
		}
	}
}