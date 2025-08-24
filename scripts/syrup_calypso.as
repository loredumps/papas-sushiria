package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="syrup_calypso")]
   public dynamic class syrup_calypso extends MovieClip
   {
       
      
      public var icon:MovieClip;
      
      public function syrup_calypso()
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
