package com.pixo.futbolbayer.view
{
	import com.greensock.core.Animation;
	import com.pixo.futbolbayer.view.match.HudView;
	import com.pixo.futbolbayer.view.match.RefereeingView;
	import com.pixo.futbolbayer.view.match.pitch.PitchView;
	import com.pixo.futbolbayer.view.trivia.TriviaView;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class MatchView extends Slider
	{
		private var _pitch:PitchView;
		private var _matchHud:HudView;
		private var _trivia:TriviaView;
		private var _refereeing:RefereeingView;
		private var _animations:AnimationsView;
		
		private function get pitch():PitchView
		{
			if (_pitch == null)
				_pitch = new PitchView();
			return _pitch;
		}
		
		private function get matchHud():HudView
		{
			if (_matchHud == null)
				_matchHud = new HudView();
			return _matchHud;
		}
		
		private function get trivia():TriviaView
		{
			if (_trivia == null)
				_trivia = new TriviaView();
			return _trivia;
		}
		
		private function get refereeing():RefereeingView
		{
			if (_refereeing == null)
				_refereeing = new RefereeingView();
			return _refereeing;
		}
		
		private function get animations():AnimationsView
		{
			if (_animations == null)
				_animations = new AnimationsView();
			return _animations;
		}
		
		public function MatchView()
		{
			addChild(pitch);
			addChild(matchHud);
			addChild(trivia);
			addChild(refereeing);
			addChild(animations);
		}
		
		override protected function hideContent():void
		{
			matchHud.hideContent();
		}
		
		override public function showContent():void
		{
			matchHud.showContent();
		}
	}
}