package com.pixo.futbolbayer.view.match.grid
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.PixelSnapping;
	import flash.display.Sprite;
	
	/**
	 * A Hexagonal Sprite wrapping a bitmap with a hexagon, centered on this sprite.
	 * 
	 * @author J.C. Wichman
	 */
	public class Tile extends Sprite 
	{
		private var _bmp:Bitmap = null;
		private var _bmpdOn:BitmapData = null;
		private var _bmpdOff:BitmapData = null;
		
		public function Tile (pRadius:int) 
		{
			_bmpdOn = new TileBitmapData (pRadius/2, 0x00ff00, 1);
			_bmpdOff = new TileBitmapData (pRadius/2, 0x000000, 0);
			_bmp = new Bitmap (_bmpdOff, PixelSnapping.AUTO, true);
			_bmp.x -= _bmp.width/2;
			_bmp.y -= _bmp.height/2;
			_bmp.alpha = 0.5;
			addChild (_bmp);
		}
		
		public function on():void 
		{
			_bmp.bitmapData = _bmpdOn;
		}
		
		public function off():void 
		{
			_bmp.bitmapData = _bmpdOff;
		}
		
	}

}