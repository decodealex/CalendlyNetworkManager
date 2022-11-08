import XCTest
@testable import CalendlyNetworkService

final class CalendlyNetworkServiceTests: XCTestCase {
    
    func testGetEndpointBuild() throws {
        let request = try ValidEndpoint.getRequest.buildURLRequest()
        
        guard let url = request.url else {
            throw TestError.generic(message: "")
        }
        
        XCTAssertTrue(url.absoluteString == "https://test.api.com/api/v1/getRequest")
        XCTAssertTrue(request.value(forHTTPHeaderField: "Authorization") == "Token token=123")
        XCTAssertTrue(request.value(forHTTPHeaderField: "Account-Token") == "123")
        
        let components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        XCTAssertNil(components?.queryItems)
    }
    
    func testPostEndpointWithParamsBuild() throws {
        let request = try ValidEndpoint.postRequestWithParameter(parameter: 23).buildURLRequest()
        
        guard let url = request.url else {
            throw TestError.generic(message: "")
        }
        
        XCTAssertTrue(request.url?.absoluteString == "https://test.api.com/api/v1/getRequestWithParameter?parameter=23")
        
        let components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        XCTAssertNotNil(components?.queryItems)
    }
    
}
