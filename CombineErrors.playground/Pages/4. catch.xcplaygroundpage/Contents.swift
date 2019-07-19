//: [Previous](@previous)

/*:
 ### `catch`
 */
import Combine
/*:
 Attaching subscriber with `catch` to recover from the error
 */
subject
    .catch { error in
        Just("recovering from the error: \(error)")
}
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
