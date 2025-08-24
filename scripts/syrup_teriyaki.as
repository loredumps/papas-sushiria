package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="syrup_teriyaki")]
   public dynamic class syrup_teriyaki extends MovieClip
   {
       
      
      public var icon:MovieClip;
      
      public function syrup_teriyaki()
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
