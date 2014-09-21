package com.pixo.futbolbayer.view
{
	import assets.animations.GameAnimations;
	
	import common.utils.AnimationPlayer;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	public class AnimationsView extends Sprite
	{
		private var animationPlayer:AnimationPlayer;
		
		public function AnimationsView()
		{
			animationPlayer = new AnimationPlayer(this);
		}
		
		public function playGoal():void
		{
			animationPlayer.loadAnimation(GameAnimations.Goal);
		}
		
		public function playOffSide():void
		{
			animationPlayer.loadAnimation(GameAnimations.OffSide);
		}
		
		public function playFault():void
		{
			animationPlayer.loadAnimation(GameAnimations.Fault);
		}
		
		public function playHandBall():void
		{
			animationPlayer.loadAnimation(GameAnimations.HandBall);
		}
		
		public function playFreeKick():void
		{
			animationPlayer.loadAnimation(GameAnimations.FreeKick);
		}
	}
}