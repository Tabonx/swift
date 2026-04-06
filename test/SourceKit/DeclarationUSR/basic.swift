// RUN: %sourcekitd-test -req=collect-decl-usr %s -- %s | %FileCheck %s
// RUN: %sourcekitd-test -req=collect-decl-usr -pos=6:1 -end-pos=8:1 %s -- %s | %FileCheck %s --check-prefix=RANGE

struct Box {
  let value: Int
  func compute(input: Int) -> Int {
    let local = input
    return local
  }
}

let topLevel = Box(value: 1)

// CHECK: <DeclarationUSRs>
// CHECK-NEXT: (4:8, 4:11): source.lang.swift.decl.struct {{.+}}
// CHECK-NEXT: (5:7, 5:12): source.lang.swift.decl.var.instance {{.+}}
// CHECK-NEXT: (6:8, 6:15): source.lang.swift.decl.function.method.instance {{.+}}
// CHECK-NEXT: (6:16, 6:21): source.lang.swift.decl.var.parameter {{.+}}
// CHECK-NEXT: (7:9, 7:14): source.lang.swift.decl.var.local {{.+}}
// CHECK-NEXT: (12:5, 12:13): source.lang.swift.decl.var.global {{.+}}
// CHECK-NEXT: </DeclarationUSRs>

// RANGE: <DeclarationUSRs>
// RANGE-NEXT: (6:8, 6:15): source.lang.swift.decl.function.method.instance {{.+}}
// RANGE-NEXT: (6:16, 6:21): source.lang.swift.decl.var.parameter {{.+}}
// RANGE-NEXT: (7:9, 7:14): source.lang.swift.decl.var.local {{.+}}
// RANGE-NEXT: </DeclarationUSRs>
