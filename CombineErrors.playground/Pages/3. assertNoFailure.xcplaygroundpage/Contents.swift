//: [Previous](@previous)

/*:
 ### `assertNoFailure`
 */
import Combine
/*:
 Attaching subscriber with `assertNoFailure`
 
 ❗️ Note: running this playground will result in intentional crash
 */
subject
    .assertNoFailure()
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
