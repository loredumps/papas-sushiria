package minigames_fla_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="minigames_fla_fla.minigame_homerun_pitcher_100")]
   public dynamic class minigame_homerun_pitcher_100 extends MovieClip
   {
       
      
      public function minigame_homerun_pitcher_100()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}
