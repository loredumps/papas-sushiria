package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="syrup_nachocheese")]
   public dynamic class syrup_nachocheese extends MovieClip
   {
       
      
      public var icon:MovieClip;
      
      public function syrup_nachocheese()
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
