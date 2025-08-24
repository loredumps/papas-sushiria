package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="syrup_yumyum")]
   public dynamic class syrup_yumyum extends MovieClip
   {
       
      
      public var icon:MovieClip;
      
      public function syrup_yumyum()
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
