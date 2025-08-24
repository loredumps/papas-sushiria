package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="syrup_generaltso")]
   public dynamic class syrup_generaltso extends MovieClip
   {
       
      
      public var icon:MovieClip;
      
      public function syrup_generaltso()
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
