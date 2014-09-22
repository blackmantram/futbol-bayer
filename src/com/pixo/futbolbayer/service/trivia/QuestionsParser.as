package com.pixo.futbolbayer.service.trivia
{
	import common.utils.MathUtils;
	
	import skyboy.serialization.JSON;
	
	public class QuestionsParser implements IQuestionsParser
	{
		public var questions:Array = new Array();
			
		public function parseQuestions(results:Object):void
		{
			var decodedQuestions:Array = skyboy.serialization.JSON.decode(String(results)) as Array;
			for each (var questionObject:Object in decodedQuestions )
				questions.push(new Question(questionObject));
		}
		
		public function getQuestion():Question
		{
			return questions[MathUtils.randomRange(0, questions.length-1)];
		}
	}
}