//: [Previous](@previous)

/*:
 ### `replaceError`
 */
import Combine
/*:
 Attaching subscriber with `replaceError` which will replace any error with given value
 */
subject
    .replaceError(with: "replaced error")
    .sink(receiveCompletion: onNeverCompletion, receiveValue: onValue)

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
