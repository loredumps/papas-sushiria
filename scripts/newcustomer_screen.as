package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="newcustomer_screen")]
   public dynamic class newcustomer_screen extends MovieClip
   {
       
      
      public var circleMC:MovieClip;
      
      public function newcustomer_screen()
      {
         super();
         addFrameScript(119,this.frame120);
      }
      
      internal function frame120() : *
      {
         stop();
      }
   }
}
