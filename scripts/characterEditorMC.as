package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="characterEditorMC")]
   public dynamic class characterEditorMC extends MovieClip
   {
       
      
      public var bgholder:MovieClip;
      
      public var bgmask:MovieClip;
      
      public var changeNameMC:MovieClip;
      
      public var fader:MovieClip;
      
      public var holder:MovieClip;
      
      public var menu:MovieClip;
      
      public var mirror_holder:MovieClip;
      
      public var mirrorbgholder:MovieClip;
      
      public var name_txt:TextField;
      
      public var namerollover_btn:SimpleButton;
      
      public var poloroid:MovieClip;
      
      public var stickertraining:MovieClip;
      
      public function characterEditorMC()
      {
         super();
      }
   }
}
