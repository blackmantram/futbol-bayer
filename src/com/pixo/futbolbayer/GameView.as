package com.pixo.futbolbayer
{
	import com.pixo.futbolbayer.view.MatchPreview;
	import com.pixo.futbolbayer.view.MatchSettingsView;
	import com.pixo.futbolbayer.view.MatchView;
	import com.pixo.futbolbayer.view.Slider;
	import com.pixo.futbolbayer.view.SoundView;
	import com.pixo.futbolbayer.view.StartView;
	import com.pixo.futbolbayer.view.TeamSettingsView;
	import com.pixo.futbolbayer.view.match.HudView;
	import com.pixo.futbolbayer.view.trivia.TriviaView;
	import com.pixo.futbolbayer.view.tweens.HorizontalSliderRemoveTween;
	import com.pixo.futbolbayer.view.tweens.HorizontalSliderShowTween;
	import com.pixo.futbolbayer.view.tweens.events.TweenEvent;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;

	public class GameView extends Sprite
	{
		private var startView:Sprite;
		private var _matchSettingsView:Slider;
		private var _teamSettingsView:Slider;
		private var _matchPreview:Slider;
		private var _match:Slider;
		
		private var showTween:HorizontalSliderShowTween = new HorizontalSliderShowTween();
		private var removeTween:HorizontalSliderRemoveTween = new HorizontalSliderRemoveTween();
		
		private var state:String = "";
		
		public function get matchSettingsView():Slider
		{
			if(_matchSettingsView == null)_matchSettingsView = new MatchSettingsView();
			return _matchSettingsView;
		}

		public function get teamSettingsView():Slider
		{
			if(_teamSettingsView == null)_teamSettingsView = new TeamSettingsView();
			return _teamSettingsView;
		}
		
		public function get matchPreview():Slider
		{
			if(_matchPreview == null)_matchPreview = new MatchPreview();
			return _matchPreview;
		}
		
		public function get match():Slider
		{
			if(_match == null)_match = new MatchView();
			return _match;
		}
		
		public function GameView(startInMatch:Boolean = false)
		{
			removeTween.addEventListener(TweenEvent.COMPLETED, handleRemoveComplete);1
			showTween.addEventListener(TweenEvent.COMPLETED, handleShowComplete);
			addChild(new SoundView());
			showStart();
		}
		
		public function showStart():void
		{
			startView = new StartView();
			addChild(startView);
			state = "Start";
		}
		
		public function showMatchSettings():void
		{
			if (state == "Start")
			{
				state = "Settings";
				toLeft(startView, matchSettingsView);
			} 
			else if (state == "Settings")
			{
				removeChild(teamSettingsView);
				addChild(matchSettingsView);
				matchSettingsView.showContent();
			}
				
		}
		
		public function showTeamSettings():void
		{
			if (state == "Settings")
			{
				removeChild(matchSettingsView);
				addChild(teamSettingsView);
				teamSettingsView.showContent();
			}
			else if (state == "Preview")
			{
				state = "Settings";
				toRight(matchPreview, teamSettingsView);
			}
		}
		
		public function showMatchPreview():void
		{
			if (state == "Settings")
			{
				state = "Preview";
				toLeft(teamSettingsView, matchPreview);
			}
		}
		
		public function showMatch():void
		{
			if (state == "Preview")
			{
				state = "Match";
				toLeft(matchPreview, match);
			}
		}
		
		private function toLeft(hidding:DisplayObject, showing:DisplayObject):void
		{
			showing.x=0;
			addChild(showing);
			showTween.tween(showing, -1);
			removeTween.tween(hidding, 1);
		}
		
		private function toRight(hidding:DisplayObject, showing:DisplayObject):void
		{
			showing.x=0;
			addChild(showing);
			showTween.tween(showing, 1);
			removeTween.tween(hidding, -1);
		}
		
		private function handleShowComplete(e:TweenEvent):void
		{
			(e.object as Slider).showContent();
		}
		
		private function handleRemoveComplete(e:TweenEvent):void
		{
			removeChild(e.object);
		}
	}
}