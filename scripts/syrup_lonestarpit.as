package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="syrup_lonestarpit")]
   public dynamic class syrup_lonestarpit extends MovieClip
   {
       
      
      public var icon:MovieClip;
      
      public function syrup_lonestarpit()
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
