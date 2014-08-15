package com.pixo.futbolbayer.view.match.grid
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.Stage;

	public class GridBuilder
	{
		private var _canvas:Sprite;
		
		private var _gridWidth:int = 21;
		private var _gridHeight:int = 11;
		
		private var _hexWidth:Number 		= 48;
		
		private var _hexHeight:Number 		= _hexWidth * Math.sin (60 * Math.PI / 180);
		
		private var _columnOffset:Number	= _hexWidth * 3 / 4;
		private var _rowOffset:Number		= _hexHeight >> 1;
		
		private var _xCenterOffset:Number = -(_columnOffset * (_gridWidth - 1)) >> 1;
		
		private var _yCenterOffset:Number = -(_hexHeight * (_gridHeight-1)) >> 1;
		
		public function GridBuilder(canvas:Sprite)
		{
			_canvas = canvas;
		}
		
		public function build():Vector.<Tile> 
		{
			_canvas.x = _canvas.stage.stageWidth >> 1;
			_canvas.y = _canvas.stage.stageHeight >> 1;
			
			var hexagons:Vector.<Tile> = new Vector.<Tile>();
			
			var lHexCount:int = _gridWidth * _gridHeight;
			var lX:int = 0;
			var lY:int = 0;
			var lHex:Tile = null;
			
			for (var i:int = 0; i < lHexCount; i++) 
			{
				lX = i % _gridWidth;
				lY = i / _gridWidth;
				
				lHex = new Tile(_hexWidth);
				lHex.x = _xCenterOffset + (lX * _columnOffset);
				lHex.y = + _yCenterOffset + (lY * _hexHeight) + ((lX%2)*_rowOffset);
				hexagons.push (lHex);
				_canvas.addChild (lHex);			
			}
			return hexagons;
		}
		
		public function addGoalTiles(invert:int=1):Array
		{
			var array:Array = new Array();
			var posX:int = (_xCenterOffset - _columnOffset) * invert;
			var posY:int = _rowOffset;
			array.push(addGoalTile(posX, posY*-1));
			array.push(addGoalTile(posX, posY));
			return array;
		}
		
		private function addGoalTile(x:int, y:int):Tile
		{
			var goalTile:Tile = new Tile(_hexWidth);
			goalTile.x = x;
			goalTile.y =y;
			_canvas.addChild (goalTile);
			return goalTile;
		}
	}
}