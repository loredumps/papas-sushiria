package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="unlockOutfitScreenMC")]
   public dynamic class unlockOutfitScreenMC extends MovieClip
   {
       
      
      public var bgholder:MovieClip;
      
      public var holder:MovieClip;
      
      public function unlockOutfitScreenMC()
      {
         super();
         addFrameScript(217,this.frame218);
      }
      
      internal function frame218() : *
      {
         stop();
      }
   }
}
