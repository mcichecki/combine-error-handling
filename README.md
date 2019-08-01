# Error handling in Combine

This playground showcases behavior of different Error handling operators available in Combine framework:
* `assertNoFailure`
* `catch`
* `mapError`
* `setFailureType`
* `retry`
* `replaceError`

**`SharedCode.swift`** file (located in Sources) contains a definition of used Subject, errors and closures used in Playground's pages files.

**[Blog post about errors in Combine which describes examples from this playground](https://medium.com/codequest/error-handling-in-combine-b6150a9fc2a7)**

![Screenshot](https://github.com/mcichecki/combine-error-handling/blob/master/screenshot.png)

Should work well on **Xcode 11.0 beta 4 (11M374r)** and above.
