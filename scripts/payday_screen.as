package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="payday_screen")]
   public dynamic class payday_screen extends MovieClip
   {
       
      
      public var circleMC:MovieClip;
      
      public var starburst:MovieClip;
      
      public function payday_screen()
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
