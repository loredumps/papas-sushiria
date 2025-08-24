package minigames_fla_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="minigames_fla_fla.kart_wheel_oilfx_28")]
   public dynamic class kart_wheel_oilfx_28 extends MovieClip
   {
       
      
      public function kart_wheel_oilfx_28()
      {
         super();
         addFrameScript(0,this.frame1,31,this.frame32);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame32() : *
      {
         gotoAndStop(1);
      }
   }
}
