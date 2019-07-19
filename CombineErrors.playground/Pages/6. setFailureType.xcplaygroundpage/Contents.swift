//: [Previous](@previous)

/*:
 ### `setFailureType`
 */
import Combine
/*:
 Attaching subscriber with `setFailureType` to match subscriber's Failure type
 
 ❗️ Note: running this playground will result in intentional crash
 */
subject
    .assertNoFailure()
    .setFailureType(to: Error.self) // it will fail anyway but we want to match the completion
    .sink(receiveCompletion: onErrorCompletion, receiveValue: onValue)

/*:
 Example of using flatMap with Just that matches error type (uncomment following code to see the result)
*/
//subject
//    .flatMap { value in
//        Just("just \(value)").setFailureType(to: Error.self)
//}
//.sink(receiveCompletion: onErrorCompletion, receiveValue: onValue)

/*:
 Producing values
 */
["1st", "2nd"].forEach { subject.send($0 + " value") }

/*:
 Error
 */
subject.send(completion: Subscribers.Completion<Error>.failure(SubjectError.defaultSubjectError))
/*:
 Completion
 */
subject.send(completion: Subscribers.Completion<Error>.finished)

//: [Next](@next)
