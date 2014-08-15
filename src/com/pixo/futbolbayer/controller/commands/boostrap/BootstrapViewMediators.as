package com.pixo.futbolbayer.controller.commands.boostrap
{
	import com.pixo.futbolbayer.GameView;
	import com.pixo.futbolbayer.GameViewMediator;
	import com.pixo.futbolbayer.view.AnimationViewMediator;
	import com.pixo.futbolbayer.view.AnimationsView;
	import com.pixo.futbolbayer.view.MatchPreview;
	import com.pixo.futbolbayer.view.MatchPreviewMediator;
	import com.pixo.futbolbayer.view.MatchSettingsView;
	import com.pixo.futbolbayer.view.MatchSettingsViewMediator;
	import com.pixo.futbolbayer.view.MatchView;
	import com.pixo.futbolbayer.view.MatchViewMediator;
	import com.pixo.futbolbayer.view.StartView;
	import com.pixo.futbolbayer.view.StartViewMediator;
	import com.pixo.futbolbayer.view.TeamSettingsView;
	import com.pixo.futbolbayer.view.TeamSettingsViewMediator;
	import com.pixo.futbolbayer.view.match.HudView;
	import com.pixo.futbolbayer.view.match.HudViewMediator;
	import com.pixo.futbolbayer.view.match.RefereeingView;
	import com.pixo.futbolbayer.view.match.RefereeingViewMediator;
	import com.pixo.futbolbayer.view.match.pitch.PitchView;
	import com.pixo.futbolbayer.view.match.pitch.PitchViewMediator;
	import com.pixo.futbolbayer.view.trivia.TriviaView;
	import com.pixo.futbolbayer.view.trivia.TriviaViewMediator;
	
	import org.robotlegs.mvcs.Command;
	
	public class BootstrapViewMediators extends Command
	{
	
		override public function execute():void
		{
			mediatorMap.mapView(GameView, GameViewMediator);
			mediatorMap.mapView(StartView, StartViewMediator);
			mediatorMap.mapView(MatchSettingsView, MatchSettingsViewMediator);
			mediatorMap.mapView(TeamSettingsView, TeamSettingsViewMediator);
			mediatorMap.mapView(MatchPreview, MatchPreviewMediator);
			mediatorMap.mapView(HudView, HudViewMediator);
			mediatorMap.mapView(MatchView, MatchViewMediator);
			mediatorMap.mapView(TriviaView, TriviaViewMediator);
			mediatorMap.mapView(PitchView, PitchViewMediator);
			mediatorMap.mapView(RefereeingView, RefereeingViewMediator);
			mediatorMap.mapView(AnimationsView, AnimationViewMediator);
		}
	
	}

}