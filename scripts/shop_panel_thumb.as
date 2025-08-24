package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="shop_panel_thumb")]
   public dynamic class shop_panel_thumb extends MovieClip
   {
       
      
      public function shop_panel_thumb()
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
