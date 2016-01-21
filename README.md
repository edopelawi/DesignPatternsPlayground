#Design Patterns Playground

This project was made as an attempt to learn [GoF's Design Patterns](https://en.wikipedia.org/wiki/Design_Patterns) and how to implement it in Swift 2. I might not implement all of them (or at least, the right way), since there's a chance that Swift 2 doesn't have concepts that available in C++ or Smalltalk, which were the main languages of the book.

I tried my best to add UI representations on how the patterns are used (instead of just print logs), and comments about the pattern that accessible from the UI!

#How To Use

- Clone / fork this repository.
- Open it on XCode 7 or up.
- Run the project in simulator / device.
- Play around a sample.
- Check how it implemented from DesignPatternsPlayground > ViewControllers > (Corresponding Pattern Group) > Pattern sample view controller.
- Trace related class from current view controller.
- ???
- Profit!

#Screenshots

![Home page](/screenshots/home_page.png)
![List of creational patterns](/screenshots/list_of_creational_patterns.png)
![Factory method sample](/screenshots/factory_method_sample.png)
![Factory method comments](/screenshots/factory_method_comments.png)
![Adapter method sample](/screenshots/adapter_method_sample.png)

#Patterns Checklist

Here's the list of patterns that currently implemented (and not).

## Creational
- [x] Abstract Factory
- [x] Builder
- [x] Factory Method
- [x] Prototype
- [x] Singleton

##Structural
- [x] Adapter
- [x] Bridge
- [x] Composite
- [ ] Decorator
- [ ] Facade
- [ ] Flyweight
- [ ] Proxy

##Behavioural
- [ ] Chain of Responsibility
- [ ] Command
- [ ] Interpreter
- [ ] Iterator
- [ ] Mediator
- [ ] Memento
- [ ] Observer
- [ ] State
- [ ] Strategy
- [ ] Template method
- [ ] Visitor

# Other TODOs

- [x] Create comments page functionality
- [ ] Add comments on implemented patterns

# License

The MIT License (MIT)

Copyright (c) 2016 Ricardo Pramana Suranta.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

