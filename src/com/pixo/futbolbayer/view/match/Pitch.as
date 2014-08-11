package com.pixo.futbolbayer.view.match 
{
	import com.pixo.futbolbayer.view.events.GridEvent;
	import com.pixo.futbolbayer.view.events.MatchProgressEvent;
	import com.pixo.futbolbayer.view.match.grid.HexagonalGrid;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	
	public class Pitch extends Sprite
	{
		private var currentPoint:Point;
		private var movements:int;
		
		private var grid:HexagonalGrid;
		private var ball:Sprite;
		
		public function get movementsLeft():int
		{
			return movements;
		}
		
		public function Pitch(ballSkin:Sprite)
		{
			init();
			ball = ballSkin;
		}
		
		private function init():void
		{
			grid = new HexagonalGrid();
			grid.addEventListener(GridEvent.SELECTED_POINT, handleSelectedPoint);
			addChild(grid);
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
			dispatchEvent(new MatchProgressEvent(MatchProgressEvent.PROGRESS, true));
			if (movements > 0)
			{
				movements --;
				grid.startMovement();
			}
		}
	}
}