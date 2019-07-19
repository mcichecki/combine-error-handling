//: [Previous](@previous)

/*:
 ### `retry`
 */
import Combine
/*:
 Attaching subscriber with `retry`
 */
subject
    .retry(3)
    .sink(receiveCompletion: onErrorCompletion, receiveValue: onValue)

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
