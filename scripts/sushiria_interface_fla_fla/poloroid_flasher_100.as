package sushiria_interface_fla_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="sushiria_interface_fla_fla.poloroid_flasher_100")]
   public dynamic class poloroid_flasher_100 extends MovieClip
   {
       
      
      public function poloroid_flasher_100()
      {
         super();
         addFrameScript(6,this.frame7);
      }
      
      internal function frame7() : *
      {
         stop();
      }
   }
}
