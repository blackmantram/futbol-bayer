package com.pixo.futbolbayer.view.match.grid
{
	import flash.media.Video;

	public class AdjacentTiles
	{
		private var tilesArray:Array;
		
		public function AdjacentTiles()
		{
			tilesArray = new Array();
		}
		
		public function addTile(tile:Tile):void
		{
			tilesArray.push(tile);
		}
		
		public function turnOn():void
		{
			for each(var tile:Tile in tilesArray)
				if (tile != null)
					tile.on();
		}
		
		public function turnOff():void
		{
			for each(var tile:Tile in tilesArray)
				if (tile != null)
					tile.off();
		}
		
		public function contains(tile:Tile):Boolean
		{
			for each(var _tile:Tile in tilesArray)
				if (tile == _tile)
					return true;
			return false;
		}
	}
}