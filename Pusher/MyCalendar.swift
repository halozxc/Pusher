import Foundation
import SwiftUI
import EventKitUI

let eventStore = EKEventStore()

struct EKEventWrapper: UIViewControllerRepresentable {

    typealias UIViewControllerType = EKEventEditViewController

    @Binding var isShowing: Bool

    var theEvent = EKEvent.init(eventStore: eventStore)
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<EKEventWrapper>) -> EKEventEditViewController {
        let store = EKEventStore()
       
        store.requestAccess(to: .event, completion: {(granted,error) in
            if granted {
                let calendar = EKCalendar.init(for: .event, eventStore: eventStore)
                
                self.theEvent.startDate = Date()
                self.theEvent.endDate = Date()
                self.theEvent.title = "前往开会"
                self.theEvent.location = "萧山机场"
                self.theEvent.calendar = calendar
             }
            else{
                print("failure")
            }
        })
        
        let controller = EKEventEditViewController()
        controller.event = theEvent
        controller.eventStore = eventStore
        controller.editViewDelegate = context.coordinator

        return controller
    }

    func updateUIViewController(_ uiViewController: EKEventWrapper.UIViewControllerType, context: UIViewControllerRepresentableContext<EKEventWrapper>) {
        //
    }


    func makeCoordinator() -> Coordinator {
        return Coordinator(isShowing: $isShowing)
    }

    class Coordinator : NSObject, UINavigationControllerDelegate, EKEventEditViewDelegate {

        @Binding var isShowing: Bool

        init(isShowing: Binding<Bool>) {
            _isShowing = isShowing
        }

        func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
            switch action {
            case .canceled:
                print("Canceled")
                isShowing = false
            case .saved:
                print("Saved")
                do {
                    try controller.eventStore.save(controller.event!, span: .thisEvent, commit: true)
                }
                catch {
                    print("Problem saving event")
                }
                isShowing = false
            case .deleted:
                print("Deleted")
                isShowing = false
            @unknown default:
                print("I shouldn't be here")
                isShowing = false
            }
        }
    }
}
