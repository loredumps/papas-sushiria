package sushiria_interface_fla_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="sushiria_interface_fla_fla.customer_comics_192")]
   public dynamic class customer_comics_192 extends MovieClip
   {
       
      
      public function customer_comics_192()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         gotoAndStop(1 + Math.ceil(Math.random() * 4));
      }
   }
}
