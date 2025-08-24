package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="syrup_marzenmustard")]
   public dynamic class syrup_marzenmustard extends MovieClip
   {
       
      
      public var icon:MovieClip;
      
      public function syrup_marzenmustard()
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
