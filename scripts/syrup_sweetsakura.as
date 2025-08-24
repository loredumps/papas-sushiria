package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="syrup_sweetsakura")]
   public dynamic class syrup_sweetsakura extends MovieClip
   {
       
      
      public var icon:MovieClip;
      
      public function syrup_sweetsakura()
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
