const { Foo } = require('../build/src');

const foo = new Foo();

console.log(foo.sayHello());
console.log(foo.sayGoodBye());