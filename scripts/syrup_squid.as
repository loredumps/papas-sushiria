package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="syrup_squid")]
   public dynamic class syrup_squid extends MovieClip
   {
       
      
      public var icon:MovieClip;
      
      public function syrup_squid()
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
