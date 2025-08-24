package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="syrup_duck")]
   public dynamic class syrup_duck extends MovieClip
   {
       
      
      public var icon:MovieClip;
      
      public function syrup_duck()
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
