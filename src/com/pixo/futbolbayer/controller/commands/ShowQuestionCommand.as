package com.pixo.futbolbayer.controller.commands
{
	import com.pixo.futbolbayer.view.events.MatchEvent;
	
	import org.robotlegs.mvcs.Command;
	
	public class ShowQuestionCommand extends Command
	{
		override public function execute():void
		{
			var evt:MatchEvent = new MatchEvent(MatchEvent.SHOW_QUESTION);
			dispatch(evt);
		}
	}
}