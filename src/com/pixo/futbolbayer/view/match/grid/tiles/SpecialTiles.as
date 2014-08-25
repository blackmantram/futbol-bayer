package com.pixo.futbolbayer.view.match.grid.tiles
{
	import com.pixo.futbolbayer.view.match.grid.Tile;

	public class SpecialTiles extends TileList
	{
		public function addTiles(tiles:Array):void
		{
			for each(var _tile:Tile in tiles)
				addTile(_tile);
		}
	}
}