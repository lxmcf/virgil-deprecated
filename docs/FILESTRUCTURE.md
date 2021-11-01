# File Structure

## Classes
```vala
namespace [NAMESPACE] {
    public class [CLASS NAME] {
        // Private property declaration
        private string _example;

        // Public property declaration
        public string example {
            get { return _example; }
        }

        // Private static property declaration
        private string _static_example;

        // Public static property declaration
        public string static_example {
            get { return _static_example; }
        }

        // Main constructor
        public [CLASS NAME]() {
            // Private property definition
            _example = "Foo!"
        }

        // Additional constructors
        ...

        // Unique methods
        public int calculate (int a, int b) {
            ...
        }

        // Set methods
        public void set_string (string text) {
            ...
        }

        // Get methods
        public string get_string () {
            ...
        }
    }
}
```
