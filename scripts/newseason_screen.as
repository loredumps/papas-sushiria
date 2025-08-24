package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="newseason_screen")]
   public dynamic class newseason_screen extends MovieClip
   {
       
      
      public var labelMC:MovieClip;
      
      public function newseason_screen()
      {
         super();
         addFrameScript(119,this.frame120);
      }
      
      internal function frame120() : *
      {
         stop();
      }
   }
}
