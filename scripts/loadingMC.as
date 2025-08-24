package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="loadingMC")]
   public dynamic class loadingMC extends MovieClip
   {
       
      
      public var bar:MovieClip;
      
      public var loader_bar:MovieClip;
      
      public function loadingMC()
      {
         super();
         addFrameScript(27,this.frame28,64,this.frame65);
      }
      
      internal function frame28() : *
      {
         stop();
      }
      
      internal function frame65() : *
      {
         stop();
      }
   }
}
