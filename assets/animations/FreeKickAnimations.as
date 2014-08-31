package animations
{
	public class FreeKickAnimations extends KickHolderAnimations
	{
		[Embed(source="FutbolBayer/cobro_tiro_libre.swf")]
		private var _Iddle:Class;
		
		[Embed(source="FutbolBayer/cobro_tiro_libre_bien.swf")]
		private var _Score:Class;
		
		[Embed(source="FutbolBayer/cobro_tiro_libre_mal.swf")]
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