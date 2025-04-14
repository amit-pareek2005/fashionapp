import FirebaseFunctions

class APIService {
    static let shared = APIService()
    private let functions = Functions.functions()

    func callExample() async throws {
        let result = try await functions.httpsCallable("exampleFunction").call()
        print("API Response: \(result.data)")
    }
}