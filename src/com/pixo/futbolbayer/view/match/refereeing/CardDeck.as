package com.pixo.futbolbayer.view.match.refereeing
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Sprite;

	public class CardDeck
	{
		private var card:Sprite;
		private var container:Sprite;
		private var cards:Array;
		
		public function CardDeck(container:Sprite, card:Sprite)
		{
			this.container = container;
			this.card = card;
			cards = new Array();
		}
		
		public function addCard():void
		{
			var newCard:DisplayObject = createCard();
			newCard.x = ((card.width - 20) * cards.length);
			cards.push(newCard);
			container.addChild(newCard);
		}
		
		public function clear():void
		{
			for each(var card:DisplayObject in cards)
				container.removeChild(card);
			cards = new Array();
		}
		
		private function createCard():Bitmap
		{
			var b:BitmapData = new BitmapData(card.width, card.height, true, 0x0);
			b.draw(card);
			return new Bitmap(b);
		}
	}
}