package com.pixo.futbolbayer.controller.commands.boostrap
{
	import com.pixo.futbolbayer.GameView;
	import com.pixo.futbolbayer.GameViewMediator;
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
			mediatorMap.mapView(MatchView, MatchViewMediator);
		}
	
	}

}