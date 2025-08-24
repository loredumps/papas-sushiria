package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   [Embed(source="/_assets/assets.swf", symbol="sponsorLogoMC")]
   public dynamic class sponsorLogoMC extends MovieClip
   {
       
      
      public var btn:SimpleButton;
      
      public function sponsorLogoMC()
      {
         super();
         addFrameScript(170,this.frame171);
      }
      
      internal function frame171() : *
      {
         stop();
      }
   }
}
