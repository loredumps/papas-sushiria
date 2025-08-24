package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   [Embed(source="/_assets/assets.swf", symbol="fliplineLogoMC")]
   public dynamic class fliplineLogoMC extends MovieClip
   {
       
      
      public var btn:SimpleButton;
      
      public function fliplineLogoMC()
      {
         super();
         addFrameScript(177,this.frame178);
      }
      
      internal function frame178() : *
      {
         stop();
      }
   }
}
