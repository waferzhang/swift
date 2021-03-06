// RUN: %target-swift-frontend(mock-sdk: %clang-importer-sdk) -parse -verify %s

import cvars

func getPI() -> Float {
  return PI
}

func testPointers() {
  let cp = globalConstPointer
  cp.abcde() // expected-error {{value of type 'UnsafePointer<Void>?' has no member 'abcde'}}
  let mp = globalPointer
  mp.abcde() // expected-error {{value of type 'UnsafeMutablePointer<Void>?' has no member 'abcde'}}
}
