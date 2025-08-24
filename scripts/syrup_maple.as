package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="syrup_maple")]
   public dynamic class syrup_maple extends MovieClip
   {
       
      
      public var icon:MovieClip;
      
      public function syrup_maple()
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
