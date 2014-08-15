package com.pixo.futbolbayer.controller.commands.boostrap
{
	import com.pixo.futbolbayer.controller.commands.CheckTurnCommand;
	import com.pixo.futbolbayer.controller.commands.MovementCommand;
	import com.pixo.futbolbayer.controller.commands.NextStepCommand;
	import com.pixo.futbolbayer.controller.commands.ShowQuestionCommand;
	import com.pixo.futbolbayer.controller.commands.StartMatchCommand;
	import com.pixo.futbolbayer.controller.commands.UpdateMatchSettingsCommant;
	import com.pixo.futbolbayer.controller.commands.UpdateTeamSettingsCommand;
	import com.pixo.futbolbayer.controller.events.GameEvent;
	import com.pixo.futbolbayer.view.events.MatchEvent;
	import com.pixo.futbolbayer.view.events.MovementEvent;
	import com.pixo.futbolbayer.view.events.SettingsEvent;
	import com.pixo.futbolbayer.view.trivia.evemts.TriviaEvent;
	
	import org.robotlegs.mvcs.Command;
	
	public class BootstrapCommands extends Command
	{
		override public function execute():void
		{
			commandMap.mapEvent(SettingsEvent.MATCH_SETTINGS_CHANGED, UpdateMatchSettingsCommant, SettingsEvent);
			commandMap.mapEvent(SettingsEvent.TEAM_SETTINGS_CHANGED, UpdateTeamSettingsCommand, SettingsEvent);
			commandMap.mapEvent(MatchEvent.START, StartMatchCommand);
			commandMap.mapEvent(MatchEvent.START, ShowQuestionCommand);
			commandMap.mapEvent(MatchEvent.STEP_FINISHED, ShowQuestionCommand);
			commandMap.mapEvent(MovementEvent.MOVEMENT, MovementCommand);
			commandMap.mapEvent(TriviaEvent.SELECTED_ANSWER, CheckTurnCommand, TriviaEvent);
			commandMap.mapEvent(TriviaEvent.SELECTED_ANSWER, NextStepCommand, TriviaEvent);
		}
	}
}