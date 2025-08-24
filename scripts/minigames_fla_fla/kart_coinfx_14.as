package minigames_fla_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="minigames_fla_fla.kart_coinfx_14")]
   public dynamic class kart_coinfx_14 extends MovieClip
   {
       
      
      public function kart_coinfx_14()
      {
         super();
         addFrameScript(0,this.frame1,20,this.frame21);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame21() : *
      {
         gotoAndStop(1);
      }
   }
}
