package com.pixo.futbolbayer.view.match.grid.tiles
{
	import com.pixo.futbolbayer.view.match.grid.Tile;

	public class SwitchableTileList extends TileList
	{
		private var areOn:Boolean = false;
		
		public function turnOn():void
		{
			for each(var tile:Tile in tilesArray)
			if (tile != null)
				tile.on();
			areOn = true;
		}
		
		public function turnOff():void
		{
			for each(var tile:Tile in tilesArray)
			if (tile != null)
				tile.off();
			areOn = false;
		}
		
		override public function contains(tile:Tile):Boolean
		{
			return areOn && super.contains(tile);
		}
	}
}