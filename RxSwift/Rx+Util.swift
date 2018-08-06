//
//  Rx+Utils.swift
//
//  Created by Felipe Florencio Garcia on 06/08/18.
//  Copyright © 2018 Felipe Florencio Garcia. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

// MARK: - Dispose Operator

// Helper in order to be easier dispose than have to write
// all the time the .disposed(by: "set the bag ")
/*
     Example how is the old way:

     let bag = DisposeBag()

     item.asObservable().subscribe { _ in
        // do whatever is suppose
     }.disposed(by: bag)

     New way:

     item.asObservable().subscribe { _ in
         // do whatever is suppose
     } >>> bag
 */

infix operator >>>: AdditionPrecedence
public func >>> (lhs: Disposable?, rhs: DisposeBag) {
    lhs?.disposed(by: rhs)
}

// MARK: - Two way binding operator

// This is a helper on that situation that you end up with a viewModel that has a observer
// that need to update like a field on view, that field is update when receive a new value
// and you have in your view a objservable that need to update that observer inside your
// view model, in order to avoid update cycle you can use this operator to only update once
/*
 Example:

 // View model to that view
 var location: Variable<String?> = Variable(nil)

 // In some logic inside our model we will set the location data
 func setValueExample() {
     location.value = "New York"
 }

 // View
 @IBOutlet weak var locationTextField: UITextField!

 // The idea here is, when our logic inside our view model have a new location
 // we need update our text field on our view, but, as user can type his location
 // if not get automatically we need update our location variable with the data from
 // our text field.

 // Implementation to listen the observer

 // The wrong or problematic way would be
 func setupObserver() {
    // Looks good as we are listening location to update text field, but if our location never
    // arrive we will need to allow user to type by him self and update our variable insise model
    viewModel.location.asDriver().drive(locationTextField.rx.text) >>> bag

    // Update the model variable when user type
    locationTextField.rx.text.orEmpty.bind(to: viewModel.location) >>> bag
 }

 // If you pay attention you could end with a cycle of one updation the both forever
 // and for this we have this operator that we created to make sure only will update once
 // without lead to problem of a eternal cycle of both update both forever :D
 func setupObserver() {
    locationTextField.rx.text <-> viewModel.location >>> bag
 }

 */

infix operator <->: AdditionPrecedence
public func <-> <T> (property: ControlProperty<T>, variable: Variable<T>) -> Disposable {
    let bindToUIDisposable = variable.asObservable().debug("Variable values in bind")
        .bind(to: property)

    let bindToVariable = property
        .debug("Property values in bind")
        .subscribe(onNext: { n in
            variable.value = n
        }, onCompleted: {
            bindToUIDisposable.dispose()
        })

    return Disposables.create(bindToUIDisposable, bindToVariable)
}

// MARK: - Unwrapping
public protocol Optionable {
    associatedtype WrappedType

    func unwrap() -> WrappedType
    func isEmpty() -> Bool
}

extension Optional: Optionable {
    public typealias WrappedType = Wrapped
    public func unwrap() -> WrappedType {
        return self!
    }
    public func isEmpty() -> Bool {
        return self == nil
    }
}

// Fast and easy way to not need to handle optionals when you only care about the
// value if we actually have a value without need to do some guard let or if else
/*
 Example:
 // View Model implementation:
 let error = BehaviorRelay<Error?>(value: nil)

 // View implementation:
 viewModel.error.asDriver().unwrap().drive(onNext: { [weak self] error in
     self?.handle(error)
 }) >>> bag

 // As you can see we just handle the error value if is not nil, as by our needs
 // our Error response can be nil, with this helper 'unwrap()' we do in a easy way

 Example for onNil

 viewModel.error.asDriver().onNil().drive(onNext: { [weak self] _ in
     self?.handleLoading()
 }) >>> bag

 // As we are using drive we will not receive a error, but according to our logic
 // we could handle in a way that when we set 'nil' to our variable we want to handle
 // in order to do this we created the helper 'onNil()' that fit our need
 */

extension ObservableType where E: Optionable {
    public func unwrap() -> Observable<E.WrappedType> {
        return self.filter({ !$0.isEmpty() }).map({ $0.unwrap() })
    }

    public func onNil() -> Observable<Void> {
        return self.filter({ $0.isEmpty() }).map({ _ -> Void in })
    }
}

// MARK: - Driver unwrapping and on nil filtering
extension SharedSequence where S == DriverSharingStrategy, E: Optionable {
    /// Only element of sequence that are not nil.
    ///
    /// - Returns: Filtered sequence to elements, that are not nil
    public func unwrap() -> SharedSequence<S, E.WrappedType> {
        return self.filter({ !$0.isEmpty() }).map({ $0.unwrap() })
    }

    /// Only elements of sequence that are nil.
    ///
    /// - Returns: Filtered sequence, where only nil produces new element, mapped to Sequence<Void>
    public func onNil() -> SharedSequence<S, Void> {
        return self.filter({ $0.isEmpty() }).map({ _ -> Void in })
    }
}

// Another helper when you want to know that ou observable is now 'Void' or kind of empty
/*
 Example:
 // View Model
 var numberOfItems: BehaviorRelay<Int> = BehaviorRelay(value: 0)

 // View
 func setupObserver() {
     viewModel.numberOfItems.asDriver().asVoid().drive(onNext: { [weak self] in
         self?.tableView.reloadData()
     }) >>> bag

     // In this scenarion, withou need to validate the value, when we set ou our view model
     // the value to 0 our 'Void' we will update our table view, withou need to validate at
     // 'onNext' the value avoiding unnecessary code only using a helper
 }

 // And another convenient helper is 'first()', with this we only
 // need to care when we receive our first valide data
 var locationSubject: PublishSubject<CLLocation?> = PublishSubject()

 locationSubject.unwrap().first().subscribe(onSuccess: { [weak self] location in
    // do whatever we want only with the first one
 }) >>> self.bag

 */

// MARK: - Any shared sequence asVoid mapping
extension SharedSequence {
    public func asVoid() -> SharedSequence<S, Void> {
        return self.map { _ in return () }
    }
}

// MARK: - Utils for observables
extension ObservableType {
    /// Returns safe single signal. It ends after first emitted element.
    ///
    /// - Returns: Safe single
    public func first() -> Single<E> {
        return self.take(1).asSingle()
    }

    /// Convenient mapping to sequence with void elements
    ///
    /// - Returns: mapped sequence as Observable<Void>
    public func asVoid() -> Observable<Void> {
        return self.map { _ in }
    }
}
