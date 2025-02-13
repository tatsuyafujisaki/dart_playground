# Best practices
- https://pub.dev/documentation/provider/latest/provider/ReadContext/read.html
  - > DON'T call read inside build if the value is used only for events:
  - > CONSIDER calling read inside event handlers:
  - > DON'T use read for creating widgets with a value that never changes
  - > CONSIDER using select for filtering unwanted rebuilds

