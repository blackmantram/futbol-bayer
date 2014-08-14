package com.pixo.futbolbayer.view.match
{
	import com.pixo.futbolbayer.view.events.RefereeingViewEvent;
	import com.pixo.futbolbayer.view.tweens.ShowRefereeTween;
	import com.pixo.futbolbayer.view.tweens.events.TweenEvent;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import skins.GameSkin;
	
	public class RefereeingView extends Sprite
	{
		private var team1Cards:Sprite;
		private var team2Cards:Sprite;
		private var popup:Sprite;
		private var card:Sprite;
		
		private var refereeTween:ShowRefereeTween = new ShowRefereeTween();
		
		public function RefereeingView()
		{
			addSkin();
			init();
		}
		
		private function addSkin():void
		{
			var skin:Sprite = new GameSkin.Refereeing() as Sprite;
			addChild(skin);
			team1Cards = skin.getChildByName("team1_cards") as Sprite;
			team2Cards = skin.getChildByName("team2_cards") as Sprite;
			popup = skin.getChildByName("popup") as Sprite;
			obtainCardSkin();
		}
		
		public function obtainCardSkin():void
		{
			card = new GameSkin.Card() as Sprite;
		}
		
		private function init():void
		{
			popup.visible = false;
		}
		
		public function playIntro():void
		{
			refereeTween.tween(popup);
			refereeTween.addEventListener(TweenEvent.COMPLETED, handleStartComplete);
		}
		
		private function handleStartComplete(e:TweenEvent):void
		{
			dispatchEvent(new RefereeingViewEvent(RefereeingViewEvent.INTRO_COMPLETED));
		}
	}
}