package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="syrup_gingermiso")]
   public dynamic class syrup_gingermiso extends MovieClip
   {
       
      
      public var icon:MovieClip;
      
      public function syrup_gingermiso()
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
