package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="syrup_wasabimayo")]
   public dynamic class syrup_wasabimayo extends MovieClip
   {
       
      
      public var icon:MovieClip;
      
      public function syrup_wasabimayo()
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
