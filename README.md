# Information system for mobile fitness support for users on the iOS platform

This system attempts to solve problems such:
> Numerous iOS applications exhibit high entry barriers resulting from complex interfaces or aggressive monetization strategies. Users encounter data fragmentation because disparate programs track exercise, nutrition, and activity without a unified analytical database. Furthermore, there is a notable lack of adaptivity as training plans fail to adjust automatically based on user progress or missed sessions.

Essencial feature:
> Dynamic load adaptation algorithm. The system doesn’t just suggest a plan; it adjusts the weight or number of repetitions for the next workout based on a subjective assessment of the difficulty of the previous session (RPE—Rate of Perceived Exertion).
> 
> All calculations and recommendation generation take place on the device using Apple Core ML frameworks, which solves the problem of dependence on the internet and subscriptions.

## Technology Stack and Architecture
The application uses SwiftUI for the user interface and SwiftData for data storage. 

## Minimum system requirements
iOS Deployment Target: iOS 26.1
Swift 6.2.1

## Git hooks 
Githooks automatically run pre-commit swiftlint.

## Integration with the assembly process
Integration with the assembly process is an integration during project assembly.

## Static classification
Static type checking - a core feature of Swift.

## How to write the documentation
Documentation comments are written using the format where each line is preceded by a triple slash ///.
Write `Parameters` and `Returns`.

### Example:
```swift
// MARK: - Functions
/// Updates the whole chart display state.
///
/// - Parameters:
///   - period: An instance of chart period.
```

## Copyright License
MIT License

Copyright (c) 2026 tob-pixel

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
