//: [Previous](@previous)

/*:
 ### `mapError`
 */
import Combine
/*:
 Attaching subscriber with `mapError` to change type of produced error
 */
subject
    .mapError { _ -> Error in
        return ProcessingError.unknown
}
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
