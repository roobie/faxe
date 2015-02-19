package faxe;

class C {
  
  public static function 
  zip<A, B, C>(a1:Array<A>, a2:Array<B>, func:A->B->C):Array<C> {
    var result = [];
    for (i in 0...a1.length) {
      result.push(func(a1[i], a2[i]));
    }
    return result;
  }

  public static function
  main() {
    var r = new haxe.unit.TestRunner();
    r.add(new TestC());
    r.run();
  }
}


class TestC extends haxe.unit.TestCase {

  public function testZip1() {
    var r1 = C.zip(["A", "B", "C"], ["1", "2", "3"], function (a, b) {
      return a + b;
    });
    assertEquals(r1[0], "A1");
    
    var r2 = C.zip(["A", "B", "C"], [1, 2, 3], function (a, b) {
      return false;
    });
    assertEquals(r2[0], false);
  }
}
