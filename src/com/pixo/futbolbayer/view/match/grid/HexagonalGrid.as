package com.pixo.futbolbayer.view.match.grid
{
	import com.pixo.futbolbayer.view.events.GridEvent;
	import com.pixo.futbolbayer.view.match.grid.tiles.AdjacentTiles;
	import com.pixo.futbolbayer.view.match.grid.tiles.GoalTiles;
	import com.pixo.futbolbayer.view.match.grid.tiles.SpecialTiles;
	import com.pixo.futbolbayer.view.match.grid.tiles.TileList;
	
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
		
		private var _goal1Tiles:GoalTiles;
		private var _goal2Tiles:GoalTiles;
		
		private var _specialTiles1:SpecialTiles;
		private var _specialTiles2:SpecialTiles;
		
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
			retrieveSpecialTiles();
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
		
		private function retrieveSpecialTiles():void
		{
			_specialTiles1 = retriever.findSpecialTiles();
			_specialTiles2 = retriever.findSpecialTiles(true);
		}
		
		private function addGoalTilesToVector():void
		{
			for each(var tile:Tile in _goal1Tiles.getTiles())
				_hexagons.push(tile);
			for each(tile in _goal2Tiles.getTiles())
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
			_adjacentTiles.turnAllOff();
			selectTile(getTileInPoint(new Point(0, 0)));
		}
		
		public function startMovement(direction:int):void
		{
			_adjacentTiles.turnOn(direction);
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
			_adjacentTiles.turnAllOff();
			selectTile(tile);
		}
		
		public function checkGoal():int
		{
			if(_goal1Tiles.contains(_current) )
				return 1;
			if(_goal2Tiles.contains(_current))
				return 2;
			return 0;
		}
		
		public function checkSpecialTile():int
		{
			if(_specialTiles1.contains(_current))
				return 1;
			if(_specialTiles2.contains(_current))
				return 2;
			return 0;
		}
	}
	
}