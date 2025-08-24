package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="newtopping_screen")]
   public dynamic class newtopping_screen extends MovieClip
   {
       
      
      public var circleMC:MovieClip;
      
      public function newtopping_screen()
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
