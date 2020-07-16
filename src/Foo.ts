import * as types from './types';

export class Foo implements types.Foo {
  sayHello() {
    return 'hello';
  }

  sayGoodBye() {
    return 'good bye';
  }
}
