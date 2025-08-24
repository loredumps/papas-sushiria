package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="syrup_ponzu")]
   public dynamic class syrup_ponzu extends MovieClip
   {
       
      
      public var icon:MovieClip;
      
      public function syrup_ponzu()
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
