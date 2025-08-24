package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="syrup_hibachi")]
   public dynamic class syrup_hibachi extends MovieClip
   {
       
      
      public var icon:MovieClip;
      
      public function syrup_hibachi()
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
