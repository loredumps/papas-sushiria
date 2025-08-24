package minigames_fla_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="minigames_fla_fla.kart_wheel_boostfx_5")]
   public dynamic class kart_wheel_boostfx_5 extends MovieClip
   {
       
      
      public function kart_wheel_boostfx_5()
      {
         super();
         addFrameScript(0,this.frame1,60,this.frame61);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame61() : *
      {
         gotoAndStop(1);
      }
   }
}
