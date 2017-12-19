---
title: "Particle Printable Buffer Library"
last_modified_at: 20171019T193100Z
---

Based on the code used internally by the Particle firmware for printing
to `String` objects (see `StringPrintableHelper` in [wiring/src/spark_wiring_string.cpp](https://github.com/spark/firmware/blob/89f8e270ce7d748a4d9d5f633a650b0bacb728da/wiring/src/spark_wiring_string.cpp#L787)), I have written a small
library that allows printing into a simple buffer. This avoids the reallocation of memory that occurs when using the `String` class.

The library is available on [GitHub](https://github.com/adrianba/printable-buffer) and I've published it to the Particle
library list so you can add it through the IDE or by use `particle library add printable-buffer` using the CLI.
