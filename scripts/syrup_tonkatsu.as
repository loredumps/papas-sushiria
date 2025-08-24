package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="syrup_tonkatsu")]
   public dynamic class syrup_tonkatsu extends MovieClip
   {
       
      
      public var icon:MovieClip;
      
      public function syrup_tonkatsu()
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
