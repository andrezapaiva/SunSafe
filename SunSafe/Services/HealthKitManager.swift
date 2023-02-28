////
////  HealthKitHelper.swift
////  SunSafe
////
////  Created by Andreza Paiva on 15/02/23.
////
//
//import HealthKit
//
//class HealthKitManager {
//
//    let sunscreenType = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier(rawValue: "SunscreenApplication"))!
//    let countUnit = HKUnit.count()
//    var sunscreen: HKQuantityType!
//    var sunscreenUnit: HKQuantity!
//    var sunscreenSample: HKQuantitySample!
//
//    static var shared: HealthKitManager = HealthKitManager()
//
//    let healthStore = HKHealthStore()
//
//    init() {
//        sunscreen = HKQuantityType(HKQuantityTypeIdentifier(rawValue: sunscreenType.identifier))
//        sunscreenUnit = HKQuantity(unit: countUnit, doubleValue: 1)
//        sunscreenSample = HKQuantitySample(type: sunscreen, quantity: sunscreenUnit, start: Date(), end: Date())
//    }
//
//    func setUpHealthRequest() {
//        if HKHealthStore.isHealthDataAvailable() {
//            let sampleType = HKQuantityTypeIdentifier(rawValue: "SunscreenApplication")
//            healthStore.requestAuthorization(toShare: [sunscreenType], read: [sunscreenType]) { success, error in
//                if success {
//                   print("Com HealthKit!")
//                } else if error != nil {
//                    // handle your error here
//                    print(error!.localizedDescription)
//                }
//            }
//        }
//    }
//    
//    func readSunscreenApplicationsCount(forToday: Date, healthStore: HKHealthStore, completion: @escaping (Double) -> Void) {
////        guard let sunscreenQuantityType = HKQuantityType.quantityType(forIdentifier: .sunscreenCount) else { return }
////        let now = Date()
////        let startOfDay = Calendar.current.startOfDay(for: now)
////
////        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
////
////        let query = HKStatisticsQuery(quantityType: sunscreenQuantityType, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, result, error in
////
////            guard let result = result, let sum = result.sumQuantity() else {
////                completion(0.0)
////                return
////            }
////
////            completion(sum.doubleValue(for: HKUnit.count()))
////        }
////
////        healthStore.execute(query)
//
//    }
//
//}
//
