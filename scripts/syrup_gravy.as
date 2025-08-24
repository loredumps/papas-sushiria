package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="syrup_gravy")]
   public dynamic class syrup_gravy extends MovieClip
   {
       
      
      public var icon:MovieClip;
      
      public function syrup_gravy()
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
