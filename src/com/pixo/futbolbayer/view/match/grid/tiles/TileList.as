package com.pixo.futbolbayer.view.match.grid.tiles
{
	import com.pixo.futbolbayer.view.match.grid.Tile;

	public class TileList
	{
		protected var tilesArray:Array;
		
		public function TileList()
		{
			tilesArray = new Array();
		}
		
		public function addTile(tile:Tile):void
		{
			tilesArray.push(tile);
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