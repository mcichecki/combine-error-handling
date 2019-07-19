import Combine

/// CurrentValueSubject with initial value
public let subject = CurrentValueSubject<String, Error>("initial value")

/// Default subject's error
public enum SubjectError: Error {
    case defaultSubjectError
}

/// Error used for mapping errors
public enum ProcessingError: Error {
    case unknown
}

/// Handling completion with Errors
public let onErrorCompletion: ((Subscribers.Completion<Error>) -> Void)? = { completion in
    switch completion {
    case .finished: print("🏁 finished")
    case .failure(let error): print("❗️ failure: \(error)")
    }
}

/// Handling completions with Never
public let onNeverCompletion: ((Subscribers.Completion<Never>) -> Void)? = { completion in
    switch completion {
    case .finished: print("🏁 finished")
    case .failure(let never): print("❗️ failure: \(never)")
    }
}

/// Handling new values
public let onValue: (String) -> Void = { value in
    print("✅ value: \(value)")
}
