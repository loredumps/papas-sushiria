package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="syrup_azuki")]
   public dynamic class syrup_azuki extends MovieClip
   {
       
      
      public var icon:MovieClip;
      
      public function syrup_azuki()
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
