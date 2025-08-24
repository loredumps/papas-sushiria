package minigames_fla_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="minigames_fla_fla.minigame_putt_starter_145")]
   public dynamic class minigame_putt_starter_145 extends MovieClip
   {
       
      
      public function minigame_putt_starter_145()
      {
         super();
         addFrameScript(0,this.frame1,9,this.frame10);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame10() : *
      {
         gotoAndStop(1);
      }
   }
}
