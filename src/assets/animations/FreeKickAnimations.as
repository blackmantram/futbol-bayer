package assets.animations
{
	public class FreeKickAnimations extends KickHolderAnimations
	{
		[Embed(source="FutbolBayer/cobro_tiro_libre.swf", mimeType="application/octet-stream")]
		private var _Iddle:Class;
		
		[Embed(source="FutbolBayer/cobro_tiro_libre_bien.swf", mimeType="application/octet-stream")]
		private var _Score:Class;
		
		[Embed(source="FutbolBayer/cobro_tiro_libre_mal.swf", mimeType="application/octet-stream")]
		private var _Fail:Class;
		
		public override function get Iddle():Class
		{
			return _Iddle;
		}
		
		public override function get Score():Class
		{
			return _Score;
		}
		
		public override function get Fail():Class
		{
			return _Fail;
		}
	}
}