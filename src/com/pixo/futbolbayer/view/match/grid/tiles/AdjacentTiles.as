package com.pixo.futbolbayer.view.match.grid.tiles
{
	import com.pixo.futbolbayer.view.match.grid.Tile;
	
	import flash.media.Video;

	public class AdjacentTiles
	{
		private var centerTiles:SwitchableTileList;
		private var leftTiles:SwitchableTileList;
		private var rightTiles:SwitchableTileList;
		
		public function AdjacentTiles()
		{
			centerTiles = new SwitchableTileList();
			leftTiles = new SwitchableTileList();
			rightTiles = new SwitchableTileList();
		}
		
		public function addCenter(tile:Tile):void
		{
			centerTiles.addTile(tile);
		}
		
		public function addLeft(tile:Tile):void
		{
			leftTiles.addTile(tile);
		}
		
		public function addRight(tile:Tile):void
		{
			rightTiles.addTile(tile);
		}
		
		public function contains(tile:Tile):Boolean
		{
			return centerTiles.contains(tile) || rightTiles.contains(tile) || leftTiles.contains(tile);
		}
		
		public function turnOn(direction:int):void
		{
			if (direction==0) turnAllOn();
			if (direction==1) turnRightOn();
			if (direction==-1) turnLeftOn();
		}
		
		private function turnAllOn():void
		{
			centerTiles.turnOn();
			rightTiles.turnOn();
			leftTiles.turnOn();
		}
		
		private function turnRightOn():void
		{
			rightTiles.turnOn();
		}
		
		private function turnLeftOn():void
		{
			leftTiles.turnOn();
		}
		
		public function turnAllOff():void
		{
			centerTiles.turnOff();
			rightTiles.turnOff();
			leftTiles.turnOff();
		}
	}
}