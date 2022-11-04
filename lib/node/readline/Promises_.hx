package node.readline;

/**
	The `readline/promise` module provides an API for reading lines of input from a Readable stream one line at a time.
**/
@:jsRequire("readline/promises") @valueModuleOnly extern class Promises_ {
	/**
		The `readlinePromises.createInterface()` method creates a new `readlinePromises.Interface` instance.
		
		```js
		const readlinePromises = require('node:readline/promises');
		const rl = readlinePromises.createInterface({
		   input: process.stdin,
		   output: process.stdout
		});
		```
		
		Once the `readlinePromises.Interface` instance is created, the most common case is to listen for the `'line'` event:
		
		```js
		rl.on('line', (line) => {
		   console.log(`Received: ${line}`);
		});
		```
		
		If `terminal` is `true` for this instance then the `output` stream will get the best compatibility if it defines an `output.columns` property,
		and emits a `'resize'` event on the `output`, if or when the columns ever change (`process.stdout` does this automatically when it is a TTY).
		
		## Use of the `completer` function
		
		The `completer` function takes the current line entered by the user as an argument, and returns an `Array` with 2 entries:
		
		- An Array with matching entries for the completion.
		- The substring that was used for the matching.
		
		For instance: `[[substr1, substr2, ...], originalsubstring]`.
		
		```js
		function completer(line) {
		   const completions = '.help .error .exit .quit .q'.split(' ');
		   const hits = completions.filter((c) => c.startsWith(line));
		   // Show all completions if none found
		   return [hits.length ? hits : completions, line];
		}
		```
		
		The `completer` function can also returns a `Promise`, or be asynchronous:
		
		```js
		async function completer(linePartial) {
		   await someAsyncWork();
		   return [['123'], linePartial];
		}
		```
	**/
	@:overload(function(options:ReadLineOptions):node.readline.promises.Interface { })
	static function createInterface(input:global.nodejs.ReadableStream, ?output:global.nodejs.WritableStream, ?completer:ts.AnyOf2<Completer, AsyncCompleter>, ?terminal:Bool):node.readline.promises.Interface;
}