package com.pixo.futbolbayer
{
	import com.pixo.futbolbayer.view.MatchPreview;
	import com.pixo.futbolbayer.view.MatchSettingsView;
	import com.pixo.futbolbayer.view.MatchView;
	import com.pixo.futbolbayer.view.StartView;
	import com.pixo.futbolbayer.view.TeamSettingsView;
	import com.pixo.futbolbayer.view.match.HudView;
	import com.pixo.futbolbayer.view.trivia.TriviaView;
	
	import flash.display.Sprite;

	public class GameView extends Sprite
	{
		private var startView:Sprite;
		private var _matchSettingsView:MatchSettingsView;
		private var _teamSettingsView:TeamSettingsView;
		private var _matchPreview:MatchPreview;
		private var _match:MatchView;
		
		public function get matchSettingsView():MatchSettingsView
		{
			if(_matchSettingsView == null)
				_matchSettingsView = new MatchSettingsView();
			return _matchSettingsView;
		}

		public function get teamSettingsView():TeamSettingsView
		{
			if(_teamSettingsView == null)
				_teamSettingsView = new TeamSettingsView();
			return _teamSettingsView;
		}
		
		public function get matchPreview():MatchPreview
		{
			if(_matchPreview == null)
				_matchPreview = new MatchPreview();
			return _matchPreview;
		}
		
		public function get match():MatchView
		{
			if(_match == null)
				_match = new MatchView();
			return _match;
		}
		
		public function GameView(startInMatch:Boolean = false)
		{
			showStart();
		}
		
		public function showStart():void
		{
			startView = new StartView();
			addChild(startView);
		}
		
		public function showMatchSettings():void
		{
			if(contains(startView))
				removeChild(startView);
			if(contains(teamSettingsView))
				removeChild(teamSettingsView);
			addChild(matchSettingsView);
		}
		
		public function showTeamSettings():void
		{
			if(contains(matchPreview))
				removeChild(matchPreview);
			if(contains(matchSettingsView))
				removeChild(matchSettingsView);
			addChild(teamSettingsView);
		}
		
		public function showMatchPreview():void
		{
			if(contains(teamSettingsView))
				removeChild(teamSettingsView);
			addChild(matchPreview);
			matchPreview.show();
		}
		
		public function showMatch():void
		{
			if(contains(matchPreview))
				removeChild(matchPreview);
			addChild(match);
		}
	}
}