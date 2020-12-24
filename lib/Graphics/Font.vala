using Virgil.Engine;

using SDL;

namespace Virgil.Graphics {

    public class Font {
        public SDLTTF.Font _font;

        public FontStyle style {
            get {
                return style;
            }

            set {
                _font.font_style = value.to_sdl ();
                style = value;
            }
        }

        public FontHinting hinting {
            get {
                return hinting;
            }

            set {
                _font.hinting = value.to_sdl ();
                hinting = value;
            }
        }

        public int outline_size {
            get {
                return outline_size;
            }

            set {
                _font.outline = value;
                outline_size = value;
            }
        }

        public Font.from_file (string filename, int size = 32) {
            if (filename != "") {
                _font = new SDLTTF.Font (filename,  size);

                if (_font == null) Utility.Log.error ("Font is null!");
            } else {
                Utility.Log.error (@"Failed to create Font from file \'$filename\'");
            }
        }

        public Font.from_resource (string filename, int size = 32) {
            try {
                Bytes bytes = GLib.resources_lookup_data (filename, ResourceLookupFlags.NONE);
                RWops rwops = new RWops.from_mem (bytes.get_data (), bytes.length);

                _font = new SDLTTF.Font.from_rwops (rwops, size);
            } catch (Error e) {
                string code = e.code.to_string ();

                Utility.Log.error (@"Failed to create Font from resource \'$filename\' with error code \'$code\'");
            }
        }

        public Font.from_rwops (RWops rwops, int size = 32) {
            _font = new SDLTTF.Font.from_rwops (rwops, size);

            if (_font == null) {
                Utility.Log.error ("Font creation with rwops failed!");
            }
        }

        public unowned SDLTTF.Font? get_sdl_font () {
            return _font;
        }
    }
}
