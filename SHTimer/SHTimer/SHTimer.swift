import Foundation

class SHTimer: NSObject {

  var timer :NSTimer?
  let time :Float?
  var repeats = false
  var fireTarget :AnyObject?
  var fireSelector :Selector?
  var fireBlock :(() -> Void)?

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
  
  func timerFired () {
    performUpdateBlock()
    performUpdateSelector()
  }
  
  func performUpdateSelector () {
    if self.fireSelector != nil && self.fireTarget != nil {
      self.fireTarget!.sendAction(self.fireSelector!, to: self.fireTarget!, forEvent: nil)
    }
  }
  
  func performUpdateBlock () {
    if self.fireBlock != nil {
      self.fireBlock!()
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
