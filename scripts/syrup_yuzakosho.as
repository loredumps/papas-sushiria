package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="syrup_yuzakosho")]
   public dynamic class syrup_yuzakosho extends MovieClip
   {
       
      
      public var icon:MovieClip;
      
      public function syrup_yuzakosho()
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
