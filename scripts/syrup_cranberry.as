package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="syrup_cranberry")]
   public dynamic class syrup_cranberry extends MovieClip
   {
       
      
      public var icon:MovieClip;
      
      public function syrup_cranberry()
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
