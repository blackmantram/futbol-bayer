package com.pixo.futbolbayer.view.match
{
	import com.pixo.futbolbayer.view.events.RefereeingViewEvent;
	import com.pixo.futbolbayer.view.match.refereeing.CardDeck;
	import com.pixo.futbolbayer.view.match.refereeing.PopUp;
	import com.pixo.futbolbayer.view.tweens.ShowRefereeTween;
	import com.pixo.futbolbayer.view.tweens.events.TweenEvent;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import skins.GameSkin;
	
	public class RefereeingView extends Sprite
	{
		private var teamCards:Array;
		private var popup:PopUp;
		
		public function RefereeingView()
		{
			addSkin();
		}
		
		private function addSkin():void
		{
			var skin:Sprite = new GameSkin.Refereeing() as Sprite;
			addChild(skin);
			initializeDecks(skin);
			popup = new PopUp(skin.getChildByName("popup") as Sprite);
		}
		
		private function initializeDecks(skin:Sprite):void
		{
			var team1_cards:Sprite = skin.getChildByName("cards_team1") as Sprite;
			var team2_cards:Sprite = skin.getChildByName("cards_team2") as Sprite;
			team2_cards.scaleX = -1;
			var card:Sprite = new GameSkin.Card() as Sprite;
			teamCards = [new CardDeck(team1_cards, card), new CardDeck(team2_cards, card)];
		}
		
		public function showStart():void
		{
			popup.show(PopUp.START, handlePopUpShown);
		}
		
		public function showPenalty():void
		{
			popup.show(PopUp.PENALTY, handlePopUpShown);
		}
		
		public function showEnd():void
		{
			popup.show(PopUp.END, handlePopUpShown);
		}
		
		private function handlePopUpShown():void
		{
			dispatchEvent(new RefereeingViewEvent(RefereeingViewEvent.POPUP_COMPLETED));
		}
		
		public function reset():void
		{
			(teamCards[0] as CardDeck).clear();
			(teamCards[1] as CardDeck).clear();
		}
		
		public function showYellowCard(turn:int):void
		{
			(teamCards[turn-1] as CardDeck).addCard();
		}
	}
}