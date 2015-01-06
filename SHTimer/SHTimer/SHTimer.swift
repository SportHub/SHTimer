import Foundation

class SHTimer: NSObject {
  
  var timer :NSTimer?
  let time :Float?
  var repeats = false
  var fireTarget :AnyObject?
  var fireSelector :Selector?
  var fireBlock :(() -> Void)?
  var fireFunction :(() -> Void)?
  
  class func startTimeWithDurtion (duration :Float, repeats :Bool, target :AnyObject, selector :Selector) -> SHTimer {
    let timer = SHTimer()
    timer.startTimeWithDurtion(duration, repeats: repeats, target: target, selector: selector)
    return timer
  }
  
  private func startTimeWithDurtion (duration :Float, repeats :Bool, target :AnyObject, selector :Selector) {
    self.fireTarget = target
    self.fireSelector = selector
    self.timer = NSTimer.scheduledTimerWithTimeInterval(Double(duration), target: self, selector: Selector("timerFired"), userInfo: nil, repeats: repeats)
  }
  
  class func startTimeWithDurtion (duration :Float, repeats :Bool, fireBlock :(() -> Void)!) -> SHTimer {
    let timer = SHTimer()
    timer.startTimeWithDurtion(duration, repeats: repeats, fireBlock: fireBlock)
    return timer
  }
  
  private func startTimeWithDurtion (duration :Float, repeats :Bool, fireBlock :(() -> Void)!) {
    self.fireBlock = fireBlock
    self.timer = NSTimer.scheduledTimerWithTimeInterval(Double(duration), target: self, selector: Selector("timerFired"), userInfo: nil, repeats: repeats)
  }
  
  class func startTimeWithDurtion (duration :Float, repeats :Bool, function :() -> Void) -> SHTimer {
    let timer = SHTimer()
    timer.startTimeWithDurtion(duration, repeats: repeats, function: function)
    return timer
  }
  
  private func startTimeWithDurtion (duration :Float, repeats :Bool, function :(() -> Void)!) {
    self.fireFunction = function
    self.timer = NSTimer.scheduledTimerWithTimeInterval(Double(duration), target: self, selector: Selector("timerFired"), userInfo: nil, repeats: repeats)
  }
  
  func timerFired () {
    performUpdateSelector()
    performUpdateFunction(self.fireFunction)
    performUpdateFunction(self.fireBlock)
  }
  
  func performUpdateFunction (function :(() -> Void)?) {
    if let updateFunction = function {
      updateFunction ()
    }
  }
  
  func performUpdateSelector () {
    if self.fireSelector != nil && self.fireTarget != nil {
      UIControl().sendAction(self.fireSelector!, to: self.fireTarget!, forEvent: nil)
    }
  }
  
  func stopTimer () {
    if let timerValid = self.timer?.valid {
      self.timer!.invalidate()
    }
  }
  
  var isValid :Bool {
    get{
      var valid = false
      if let timerValid = self.timer?.valid {
        valid = timerValid
      }
      return valid
    }
  }
  
}