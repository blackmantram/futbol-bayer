package com.pixo.futbolbayer.controller.commands.boostrap
{
	import com.pixo.futbolbayer.controller.commands.CheckAnswerCommand;
	import com.pixo.futbolbayer.controller.commands.ExecuteFaultCommand;
	import com.pixo.futbolbayer.controller.commands.ExecuteFreeKickCommand;
	import com.pixo.futbolbayer.controller.commands.ExecutePenaltyCommand;
	import com.pixo.futbolbayer.controller.commands.ExecuteSkipTurnCommand;
	import com.pixo.futbolbayer.controller.commands.FinishSpecialActionCommand;
	import com.pixo.futbolbayer.controller.commands.MovementCommand;
	import com.pixo.futbolbayer.controller.commands.NextStepCommand;
	import com.pixo.futbolbayer.controller.commands.PauseCommand;
	import com.pixo.futbolbayer.controller.commands.PlayAmbienceSoundCommand;
	import com.pixo.futbolbayer.controller.commands.PlayLowAmbienceSoundCommand;
	import com.pixo.futbolbayer.controller.commands.PlayNormalAmbienceSoundCommand;
	import com.pixo.futbolbayer.controller.commands.PlayWhistleCommand;
	import com.pixo.futbolbayer.controller.commands.ResumeMatchCommand;
	import com.pixo.futbolbayer.controller.commands.ScoreCommand;
	import com.pixo.futbolbayer.controller.commands.SelectSpecialActionCommand;
	import com.pixo.futbolbayer.controller.commands.ShowQuestionCommand;
	import com.pixo.futbolbayer.controller.commands.SpecialActionCommand;
	import com.pixo.futbolbayer.controller.commands.StartMatchCommand;
	import com.pixo.futbolbayer.controller.commands.StopLoopCommand;
	import com.pixo.futbolbayer.controller.commands.UpdateMatchSettingsCommant;
	import com.pixo.futbolbayer.controller.commands.UpdateTeamSettingsCommand;
	import com.pixo.futbolbayer.controller.events.GameEvent;
	import com.pixo.futbolbayer.view.events.AnimationEvent;
	import com.pixo.futbolbayer.view.events.MatchEvent;
	import com.pixo.futbolbayer.view.events.MovementEvent;
	import com.pixo.futbolbayer.view.events.RefereeingEvent;
	import com.pixo.futbolbayer.view.events.SettingsEvent;
	import com.pixo.futbolbayer.view.events.SpecialActionEvent;
	import com.pixo.futbolbayer.view.trivia.evemts.TriviaEvent;
	
	import flash.net.getClassByAlias;
	
	import org.robotlegs.mvcs.Command;
	
	public class BootstrapCommands extends Command
	{
		override public function execute():void
		{
			commandMap.mapEvent(SettingsEvent.MATCH_SETTINGS_CHANGED, UpdateMatchSettingsCommant, SettingsEvent);
			commandMap.mapEvent(SettingsEvent.TEAM_SETTINGS_CHANGED, UpdateTeamSettingsCommand, SettingsEvent);
			
			commandMap.mapEvent(RefereeingEvent.REFEREE, StartMatchCommand);
			commandMap.mapEvent(RefereeingEvent.REFEREE, ExecutePenaltyCommand);
			commandMap.mapEvent(MatchEvent.OFF_SIDE, ExecutePenaltyCommand);
			
			commandMap.mapEvent(MatchEvent.START, ShowQuestionCommand);
			commandMap.mapEvent(MatchEvent.STEP_FINISHED, ShowQuestionCommand);
			commandMap.mapEvent(MatchEvent.SCORE, ScoreCommand);
			commandMap.mapEvent(MatchEvent.SCORE, PauseCommand);
			
			commandMap.mapEvent(MatchEvent.RESUME, ResumeMatchCommand);
			commandMap.mapEvent(AnimationEvent.ANIMATION_FINISHED, ResumeMatchCommand);
			commandMap.mapEvent(AnimationEvent.ANIMATION_FINISHED, ExecuteSkipTurnCommand);
			commandMap.mapEvent(AnimationEvent.ANIMATION_FINISHED, ExecuteFaultCommand);
			commandMap.mapEvent(AnimationEvent.ANIMATION_FINISHED, ExecuteFreeKickCommand);
			
			commandMap.mapEvent(MovementEvent.MOVEMENT, MovementCommand);
			commandMap.mapEvent(TriviaEvent.SELECTED_ANSWER, CheckAnswerCommand, TriviaEvent);
			commandMap.mapEvent(TriviaEvent.SELECTED_ANSWER, NextStepCommand, TriviaEvent);
			
			commandMap.mapEvent(SpecialActionEvent.SPECIAL_ACTION_TRIGGERED, SpecialActionCommand, SpecialActionEvent);
			commandMap.mapEvent(SpecialActionEvent.SPECIAL_ACTION_STARTED, SelectSpecialActionCommand);
			commandMap.mapEvent(SpecialActionEvent.SPECIAL_ACTION_FINISHED, FinishSpecialActionCommand);
			
			commandMap.mapEvent(GameEvent.MATCH_SETTINGS, PlayAmbienceSoundCommand);
			commandMap.mapEvent(GameEvent.TEAM_SETTINGS, PlayLowAmbienceSoundCommand);
			commandMap.mapEvent(GameEvent.PREVIEW, PlayNormalAmbienceSoundCommand);
			commandMap.mapEvent(GameEvent.GOTO_MATCH, StopLoopCommand);
			commandMap.mapEvent(RefereeingEvent.SHOW_REFEREE, PlayWhistleCommand);
		}
	}
}