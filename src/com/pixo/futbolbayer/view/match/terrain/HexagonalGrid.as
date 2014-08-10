package com.pixo.futbolbayer.view.match.terrain
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.utils.getTimer;
	import com.pixo.futbolbayer.view.events.GridEvent;
	
	//most of this class functionality was taken from 
	//http://www.innerdrivestudios.com/blog/as3-tile-based-gaming/hexagon-tile-grids-in-actionscript-3
	public class HexagonalGrid extends Sprite 
	{
		private var _canvas:Sprite = null;
		
		private var _adjacentTiles:Array = new Array();
		
		private var _hexagons:Vector.<Tile> = null;

		private var _gridWidth:int = 21;
		private var _gridHeight:int = 11;
		
		private var _hexWidth:Number 		= 48;
		
		private var _hexHeight:Number 		= _hexWidth * Math.sin (60 * Math.PI / 180);
		
		private var _columnOffset:Number	= _hexWidth * 3 / 4;
		private var _rowOffset:Number		= _hexHeight >> 1;
		
		private var _xCenterOffset:Number = -(_columnOffset * (_gridWidth - 1)) >> 1;
		
		private var _yCenterOffset:Number = -(_hexHeight * (_gridHeight-1)) >> 1;
		
		private var _current:Tile = null;
		
		public function HexagonalGrid():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			_canvas = new Sprite();
			_canvas.x = stage.stageWidth >> 1;
			_canvas.y = stage.stageHeight >> 1;
			addChild (_canvas);
			
			_hexagons = new Vector.<Tile>();

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
				_hexagons.push (lHex);
				_canvas.addChild (lHex);			
			}
			
			selectTile(getTileInPoint(new Point(_canvas.x, _canvas.y)));
		}
		
		private function getTileInPoint(lPoint:Point):Tile 
		{
			var lXMouseOffset:Number = _canvas.x + _xCenterOffset - _hexWidth / 2;
			
			var lX:Number = (lPoint.x - lXMouseOffset) / _columnOffset;
			if (lX < 0 || lX >= _gridWidth) return null;
			lX = int (lX);
			
			var lYMouseOffset:Number = _canvas.y + _yCenterOffset - _rowOffset 
			
			var lY:Number = (lPoint.y - lYMouseOffset - lX%2*_rowOffset) / _hexHeight;
			if (lY < 0 || lY >= _gridHeight) return null;
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
		}
		
		private function selectTile(tile:Tile):void
		{
			_current = tile;
			dispatchEvent(new GridEvent(GridEvent.SELECTED_POINT, new Point(_canvas.x + tile.x, _canvas.y + tile.y)));
		}
		
		/*public function startMovement():void
		{
			findAdjacentTiles();
			addEventListener(MouseEvent.MOUSE_DOWN, handleMouseDown);
		}
		
		private function handleMouseDown(e:Event):void
		{
			var tile:Tile = getTileInPoint(new Point(stage.mouseX, stage.mouseY));
			if (tile != null)
				for each(var adjacentTile:Tile in _adjacentTiles)
					if (tile == adjacentTile)
						completeMovement(tile);
		}
		
		private function completeMovement(tile:Tile):void
		{
			removeEventListener(MouseEvent.MOUSE_DOWN, handleMouseDown);
			selectTile(tile);
		}
		
		private function turnAdjacentTilesOff():void
		{
			for each(var adjacentTile:Tile in _adjacentTiles)
				adjacentTile.off();
		}
		
		private function findAdjacentTiles():void
		{
			_adjacentTiles = new Array();
			
			setAdjacentTile (new Point(_current.x, _current.y + _hexHeight));
			
			setAdjacentTile (new Point(_current.x, _current.y - _hexHeight));
			
			var _xTileOffset:int = _columnOffset;
			var _ytileOffset:int = (Math.tan(30 * Math.PI / 180) * _xTileOffset);
			
			setAdjacentTile (new Point(_current.x + _xTileOffset, _current.y + _ytileOffset));
			
			setAdjacentTile (new Point(_current.x + _xTileOffset, _current.y - _ytileOffset));
			
			setAdjacentTile (new Point(_current.x - _xTileOffset, _current.y + _ytileOffset));
			
			setAdjacentTile (new Point(_current.x - _xTileOffset, _current.y - _ytileOffset));
		}
		
		private function setAdjacentTile(point:Point):void
		{
			point.offset(_canvas.x, _canvas.y);
			var tile:Tile = getTileInPoint(point);
			if (tile != null)
			{
				tile.on();
				_adjacentTiles.push(tile);
			}
		}*/
	}
	
}