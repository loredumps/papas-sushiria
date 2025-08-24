package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="syrup_sriracha")]
   public dynamic class syrup_sriracha extends MovieClip
   {
       
      
      public var icon:MovieClip;
      
      public function syrup_sriracha()
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
