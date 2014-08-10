package com.pixo.futbolbayer.view.match.terrain 
{
	import com.pixo.futbolbayer.view.events.GridEvent;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	
	public class Pitch extends Sprite
	{
		private var currentPoint:Point;
		private var movements:int;
		
		private var grid:HexagonalGrid = new HexagonalGrid();
		private var ball:Sprite;
		
		public function Pitch(ballSkin:Sprite)
		{
			init();
			ball = ballSkin;
		}
		
		private function init():void
		{
			grid.addEventListener(GridEvent.SELECTED_POINT, handleSelectedPoint);
			addChild(grid);
		}
		
		private function handleSelectedPoint(e:GridEvent):void 
		{
			ball.x = e.point.x;
			ball.y = e.point.y;
		}
		
		/*
		
		public function move(movements:int):void
		{
			_movements = movements;
			checkMovements();
		}
		
		
		
		private function checkMovements():void 
		{
			if (_movements > 0)
			{
				_movements --;
				_grid.startMovement();
			}
			trace(_movements);
		}*/
	}
}