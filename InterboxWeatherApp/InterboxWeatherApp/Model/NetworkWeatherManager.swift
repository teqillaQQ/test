//
//  NetworkWeatherManager.swift
//  InterboxWeatherApp
//
//  Created by Александр Савков on 26.12.21.
//53.902284  27.561831

import Foundation

struct NetworkWeatherManager {
    func fetchWeather(latitude: Double, longitude: Double, completionHandler: @escaping (Weather) -> Void) {
        let urlString = "https://api.weather.yandex.ru/v2/forecast?lat=\(latitude)&lon=\(longitude)"
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.addValue("\(apyKey)" , forHTTPHeaderField: "X-Yandex-API-Key")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            //print(String(data: data, encoding: .utf8)!)
            if let weather = self.parseJSON(withData: data) {
                completionHandler(weather)
            }
        }
        task.resume()
    }
    func parseJSON(withData data: Data) -> Weather? {
        let decoder = JSONDecoder()
        do {
            let weatherData = try decoder.decode(WeatherData.self, from: data)
            guard let weather = Weather(weatherData: weatherData) else {
                return nil
            }
            return weather
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
