import luxe.Input;
import luxe.ParcelProgress;
import luxe.Vector;
import luxe.Parcel;

class Main extends luxe.Game {
	var loaded:Bool = false;

	override function ready() {
		// load the parcel
		Luxe.loadJSON("assets/parcel.json", function(jsonParcel) {
			var parcel = new Parcel();
			parcel.from_json(jsonParcel.json);

			// show a loading bar
			// use a fancy custom loading bar (https://github.com/FuzzyWuzzie/CustomLuxePreloader)
			new ParcelProgress({
				parcel: parcel,
				oncomplete: assetsLoaded
			});
			
			// start loading!
			parcel.load();
		});
	} //ready

	function assetsLoaded(_) {
		Luxe.audio.create("assets/test.ogg", "test").then(
		function(_) {
			trace("Music loaded!");
			loaded = true;
			Luxe.audio.loop("test");
		},
		function(reason) {
			trace("Failed to load test sound! Reason: $reason");
		});
	} // assetsLoaded

	override function onkeyup( e:KeyEvent ) {
		if(!loaded) return;
	} //onkeyup

} //Main
