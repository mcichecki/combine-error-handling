//: [Previous](@previous)

/*:
 ### No error handling
 */
import Combine
/*:
 Attaching subscriber without any error handling
 */
subject
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
