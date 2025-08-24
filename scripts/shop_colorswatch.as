package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="shop_colorswatch")]
   public dynamic class shop_colorswatch extends MovieClip
   {
       
      
      public var bg:MovieClip;
      
      public var owned:MovieClip;
      
      public var unavailable:MovieClip;
      
      public function shop_colorswatch()
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
