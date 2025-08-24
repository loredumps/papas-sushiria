package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="newhire_screen")]
   public dynamic class newhire_screen extends MovieClip
   {
       
      
      public var circleMC:MovieClip;
      
      public var starburst:MovieClip;
      
      public function newhire_screen()
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
