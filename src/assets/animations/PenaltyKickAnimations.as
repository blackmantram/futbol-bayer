package assets.animations
{
	public class PenaltyKickAnimations extends KickHolderAnimations
	{
		[Embed(source="FutbolBayer/cobro_penalty.swf", mimeType="application/octet-stream")]
		private var _Iddle:Class;
		
		[Embed(source="FutbolBayer/cobro_penalty_bien.swf", mimeType="application/octet-stream")]
		private var _Score:Class;
		
		[Embed(source="FutbolBayer/cobro_penalty_mal.swf", mimeType="application/octet-stream")]
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