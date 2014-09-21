package com.pixo.futbolbayer.view.match.pitch
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	import assets.skins.GameSkin;

	public class Banner
	{
		private var container:Sprite;
		private var animation:MovieClip;
		
		public function Banner(container:Sprite)
		{
			animation = new GameSkin.BannerAnimation() as MovieClip;
			container.addChild(animation);
			this.container = container;
		}
		
		public function setAssets(assets:Array):void
		{
			var counter:int = 1;
			for each(var asset:DisplayObject in assets)
			{
				var animatedSection:Sprite = animation.getChildByName("banner"+counter) as Sprite;
				animatedSection.addChild(asset);
				counter++;
				if (counter > 6)
					break;
			}
		}
	}
}