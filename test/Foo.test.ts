import { Foo } from '../src';
import assert = require('assert');

describe('Foo', () => {
  let foo: Foo;
  beforeEach(() => {
    foo = new Foo();
  });
  it('should create an instance', () => {
    assert.ok(foo instanceof Foo);
  });
  it('should say "hello"', () => {
    assert.strictEqual(foo.sayHello(), 'hello');
  });
  it('should say "good bye"', () => {
    assert.strictEqual(foo.sayGoodBye(), 'good bye');
  });
});
