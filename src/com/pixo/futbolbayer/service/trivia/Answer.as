package com.pixo.futbolbayer.service.trivia
{
	
	public class Answer
	{
		public var text:String;
		public var isCorrect:Boolean;
		
		public function Answer(answerObject:Object):void
		{
			text = answerObject["text"];
			isCorrect = answerObject["isCorrect"] != null ? answerObject["isCorrect"] : false;
		}
	}
}