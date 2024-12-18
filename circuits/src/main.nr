
fn main(x: Field, y: pub Field) {
    assert(x == y);
    let x = x * 2 + y;
    assert(x == 9);
}
