package com.pixo.futbolbayer.view.match.grid
{
	import com.pixo.futbolbayer.view.events.GridEvent;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.utils.getTimer;
	
	//most of this class functionality was taken from 
	//http://www.innerdrivestudios.com/blog/as3-tile-based-gaming/hexagon-tile-grids-in-actionscript-3
	public class HexagonalGrid extends Sprite 
	{
		private var _canvas:Sprite = null;
		private var _hexagons:Vector.<Tile>;
		
		private var _adjacentTiles:AdjacentTiles;
		private var _current:Tile = null;
		
		private var retriever:GridTileRetriever;
		
		public function HexagonalGrid():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event=null):void
		{
			_canvas = new Sprite();
			addChild(_canvas);
			buildGrid();
			selectTile(getTileInPoint(new Point(0, 0)));
		}
		
		private function buildGrid():void 
		{
			var gridBuilder:GridBuilder = new GridBuilder(_canvas);
			_hexagons = gridBuilder.build();
			retriever = new GridTileRetriever(_canvas, _hexagons);
		}
		
		private function getTileInPoint(lPoint:Point):Tile 
		{
			return retriever.retrieve(lPoint);
		}
		
		private function selectTile(tile:Tile):void
		{
			_current = tile;
			_adjacentTiles = retriever.findAdjacentTiles(tile);
			dispatchEvent(new GridEvent(GridEvent.SELECTED_POINT, new Point(_canvas.x + tile.x, _canvas.y + tile.y)));
		}
		
		public function startMovement():void
		{
			_adjacentTiles.turnOn();
			addEventListener(MouseEvent.MOUSE_DOWN, handleMouseDown);
		}
		
		private function handleMouseDown(e:Event):void
		{
			var mousePoint:Point = new Point(stage.mouseX, stage.mouseY);
			mousePoint.offset(-_canvas.x, -_canvas.y);
			var tile:Tile = getTileInPoint(mousePoint);
			if (tile != null && _adjacentTiles.contains(tile))
				completeMovement(tile);
		}
		
		private function completeMovement(tile:Tile):void
		{
			removeEventListener(MouseEvent.MOUSE_DOWN, handleMouseDown);
			_adjacentTiles.turnOff();
			selectTile(tile);
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