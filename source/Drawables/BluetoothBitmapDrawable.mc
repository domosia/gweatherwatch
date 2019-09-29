using Toybox.WatchUi as Ui;
using Toybox.System as Sys;
using Toybox.Graphics;

class BluetoothBitmapDrawable extends PositionableDrawable {
	protected var onBmp, offBmp;
	protected var xalign;
    function initialize(params) {
    	PositionableDrawable.initialize(params);
		self.onBmp = Ui.loadResource(Rez.Drawables.bton);
		self.offBmp = Ui.loadResource(Rez.Drawables.btoff);
		if (params.hasKey(:xalign)) {
			self.xalign = params.get(:xalign);
		}
		if ("center".equals(self.xalign)) {
			locX -= self.onBmp.getWidth() / 2;
		}
    }

    function draw(dc) {
    	var value = Sys.getDeviceSettings().phoneConnected;
    	Sys.println("Phone connection: " + value);
    	value = false;
		dc.drawBitmap(locX, locY, value ? self.onBmp : self.offBmp);
    }
}
