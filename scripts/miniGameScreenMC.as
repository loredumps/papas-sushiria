package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   [Embed(source="/_assets/assets.swf", symbol="miniGameScreenMC")]
   public dynamic class miniGameScreenMC extends MovieClip
   {
       
      
      public var foodini:minigame_foodini;
      
      public var holder:MovieClip;
      
      public var hud:MovieClip;
      
      public var logo:MovieClip;
      
      public var play_btn:SimpleButton;
      
      public var prizepanel:MovieClip;
      
      public var skip_btn:SimpleButton;
      
      public var trainingclip:MovieClip;
      
      public function miniGameScreenMC()
      {
         super();
         addFrameScript(94,this.frame95,174,this.frame175,335,this.frame336,407,this.frame408);
      }
      
      internal function frame95() : *
      {
         stop();
      }
      
      internal function frame175() : *
      {
         stop();
      }
      
      internal function frame336() : *
      {
         stop();
      }
      
      internal function frame408() : *
      {
         gotoAndPlay("fadeout");
      }
   }
}
