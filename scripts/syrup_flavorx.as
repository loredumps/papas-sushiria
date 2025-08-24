package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="syrup_flavorx")]
   public dynamic class syrup_flavorx extends MovieClip
   {
       
      
      public var icon:MovieClip;
      
      public function syrup_flavorx()
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
