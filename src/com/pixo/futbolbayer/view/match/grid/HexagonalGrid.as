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
		
		private var _goal1Tiles:Array = new Array();
		private var _goal2Tiles:Array = new Array();
		
		private var retriever:GridTileRetriever;
		
		public function HexagonalGrid(container:Sprite):void 
		{
			container.addChild(this);
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
			_goal1Tiles = gridBuilder.addGoalTiles();
			_goal2Tiles = gridBuilder.addGoalTiles(-1);
			addGoalTilesToVector();
			retriever = new GridTileRetriever(_canvas, _hexagons);
		}
		
		private function addGoalTilesToVector():void
		{
			for each(var tile:Tile in _goal1Tiles)
				_hexagons.push(tile);
			for each(tile in _goal2Tiles)
				_hexagons.push(tile);
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
		
		public function restart():void
		{
			removeEventListener(MouseEvent.MOUSE_DOWN, handleMouseDown);
			_adjacentTiles.turnOff();
			selectTile(getTileInPoint(new Point(0, 0)));
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
		
		public function checkGoal():int
		{
			if(isTileInGoal(_goal1Tiles))
				return 1;
			if(isTileInGoal(_goal2Tiles))
				return 2;
			return 0;
		}
		
		private function isTileInGoal(array:Array):Boolean
		{
			for each(var tile:Tile in array)
				if (_current == tile)
					return true;
			return false;
		}
	}
	
}