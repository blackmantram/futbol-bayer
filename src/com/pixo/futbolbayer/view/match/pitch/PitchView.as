package com.pixo.futbolbayer.view.match.pitch 
{
	import com.pixo.futbolbayer.view.events.GridEvent;
	import com.pixo.futbolbayer.view.events.MatchEvent;
	import com.pixo.futbolbayer.view.match.grid.HexagonalGrid;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	
	import skins.GameSkin;
	
	public class PitchView extends Sprite
	{
		private var currentPoint:Point;
		private var movements:int;
		
		private var dice:Dice;
		private var grid:HexagonalGrid;
		private var ball:Sprite;
		private var stadium:Sprite;
		
		public function get movementsLeft():int
		{
			return movements;
		}
		
		public function PitchView()
		{
			addSkin();
			addListeners();
		}
		
		private function addSkin():void
		{
			var skin:Sprite = new GameSkin.PitchSkin() as Sprite;
			addChild(skin);
			stadium = skin.getChildByName("stadium_container") as Sprite;
			grid = new HexagonalGrid(skin.getChildByName("grid") as Sprite);
			dice = new Dice(skin.getChildByName("dice") as MovieClip);
			ball = skin.getChildByName("ball") as Sprite;
		}
		
		private function addListeners():void
		{
			grid.addEventListener(GridEvent.SELECTED_POINT, handleSelectedPoint);
		}
		
		private function handleSelectedPoint(e:GridEvent):void 
		{
			ball.x = e.point.x;
			ball.y = e.point.y;
			checkMovements();
		}
		
		public function move(movements:int):void
		{
			this.movements = movements;
			checkMovements();
		}
		
		private function checkMovements():void 
		{
			dispatchEvent(new MatchEvent(MatchEvent.MOVEMENT, true));
			if (movements > 0)
			{
				movements --;
				grid.startMovement();
			}
		}
		
		public function setStadiumAsset(asset:DisplayObject):void 
		{
			stadium.addChild(asset);
		}
	}
}