package com.pixo.futbolbayer.view.match.grid
{
	import flash.display.Sprite;
	import flash.geom.Point;

	public class GridTileRetriever
	{
		private var _canvas:Sprite;
		private var _hexagons:Vector.<Tile>;
		
		private var _gridWidth:int = 21;
		private var _gridHeight:int = 11;
		
		private var _hexWidth:Number 		= 48;
		
		private var _hexHeight:Number 		= _hexWidth * Math.sin (60 * Math.PI / 180);
		
		private var _columnOffset:Number	= _hexWidth * 3 / 4;
		private var _rowOffset:Number		= _hexHeight >> 1;
		
		private var _xCenterOffset:Number = -(_columnOffset * (_gridWidth - 1)) >> 1;
		
		private var _yCenterOffset:Number = -(_hexHeight * (_gridHeight-1)) >> 1;
		
		private var _sensitiveArea:Number 		= 26;
		
		public function GridTileRetriever(canvas:Sprite, hexagons:Vector.<Tile>)
		{
			_canvas = canvas;
			_hexagons = hexagons;
		}
		/*
		public function retrieve(lPoint:Point):Tile 
		{
			lPoint.offset(_canvas.x, _canvas.y);
			var lXMouseOffset:Number = _canvas.x + _xCenterOffset - _hexWidth / 2;
			
			var lX:Number = (lPoint.x - lXMouseOffset) / _columnOffset;
			//if (lX < 0 || lX >= _gridWidth) return null;
			lX = int (lX);
			
			var lYMouseOffset:Number = _canvas.y + _yCenterOffset - _rowOffset 
			
			var lY:Number = (lPoint.y - lYMouseOffset - lX%2*_rowOffset) / _hexHeight;
			//if (lY < 0 || lY >= _gridHeight) return null;
			lY = int (lY);
			
			var x:Number = (lX * _columnOffset) + lXMouseOffset;
			var y:Number = (_hexHeight * lY) + ((lX % 2) * _rowOffset) + lYMouseOffset + _rowOffset;
			var lQuart:Number = 1 / 4 * _hexWidth;
			var lDeltaX:Number = lPoint.x - x;
			var lDeltaY:Number = lPoint.y - y;
			var lBreak:Number = (lDeltaX / lQuart) * _rowOffset;
			
			if (lDeltaX < lQuart) {
				if (lDeltaY < -lBreak) {
					lX -= 1;
					lY -= (lX%2==0)?0:1;
				} else if (lDeltaY > lBreak) {
					lX -= 1;
					lY += (lX%2==0)?1:0;
				}
			} 
			
			if (lX >= 0 && lX < _gridWidth && lY >= 0 && lY < _gridHeight)
				return _hexagons[lY * _gridWidth + lX];
			else
				return null;
		}*/
		
		public function retrieve(lPoint:Point):Tile 
		{
			for each(var tile:Tile in _hexagons)
				if ( lPoint.x-_sensitiveArea < tile.x && 
					lPoint.x+_sensitiveArea > tile.x && 
					lPoint.y-_sensitiveArea < tile.y && 
					lPoint.y+_sensitiveArea > tile.y)
				{
					return tile;
				}
			return null;
		}
		
		public function findAdjacentTiles(tile:Tile):AdjacentTiles
		{
			var adjacentTiles:AdjacentTiles = new AdjacentTiles();
			
			adjacentTiles.addTile(retrieve(new Point(tile.x, tile.y + _hexHeight)));
			adjacentTiles.addTile(retrieve(new Point(tile.x, tile.y - _hexHeight)));
			
			var _xTileOffset:int = _columnOffset;
			var _ytileOffset:int = (Math.tan(30 * Math.PI / 180) * _xTileOffset);
			
			adjacentTiles.addTile(retrieve(new Point(tile.x + _xTileOffset, tile.y + _ytileOffset)));
			adjacentTiles.addTile(retrieve(new Point(tile.x + _xTileOffset, tile.y - _ytileOffset)));
			adjacentTiles.addTile(retrieve(new Point(tile.x - _xTileOffset, tile.y + _ytileOffset)));
			adjacentTiles.addTile(retrieve(new Point(tile.x - _xTileOffset, tile.y - _ytileOffset)));
			
			return adjacentTiles;
		}
	}
}