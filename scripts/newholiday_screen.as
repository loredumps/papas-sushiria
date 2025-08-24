package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="newholiday_screen")]
   public dynamic class newholiday_screen extends MovieClip
   {
       
      
      public var labelMC:MovieClip;
      
      public function newholiday_screen()
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
