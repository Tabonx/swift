// RUN: %sourcekitd-test -req=collect-decl-usr %s -- %s | %FileCheck %s

struct MyStruct {
  let stored: Int

  func method(parameter: Int) -> Int {
    return parameter + stored
  }
}

// CHECK: key.kind: source.lang.swift.decl.struct
// CHECK-NEXT: key.usr:
// CHECK-SAME: MyStruct
// CHECK: key.kind: source.lang.swift.decl.var.instance
// CHECK-NEXT: key.usr:
// CHECK-SAME: stored
// CHECK: key.kind: source.lang.swift.decl.function.method.instance
// CHECK-NEXT: key.usr:
// CHECK-SAME: method
// CHECK: key.kind: source.lang.swift.decl.var.parameter
// CHECK-NEXT: key.usr:
// CHECK-SAME: parameter
