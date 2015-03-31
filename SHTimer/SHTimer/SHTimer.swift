import UIKit

public typealias FireBlock = (() -> Void)?

public class SHTimer: NSObject {
  
  var timer :NSTimer!
  var fireBlock :FireBlock
  
  public class func startTimeWithDurtion (duration :Float, repeats :Bool, fireBlock :FireBlock) -> SHTimer {
    let timer = SHTimer()
    timer.startTimeWithDurtion(duration, repeats: repeats, fireBlock: fireBlock)
    return timer
  }
  
  private func startTimeWithDurtion (duration :Float, repeats :Bool, fireBlock :FireBlock) {
    self.fireBlock = fireBlock
    self.timer = NSTimer.scheduledTimerWithTimeInterval(Double(duration), target: self, selector: Selector("timerFired"), userInfo: nil, repeats: repeats)
  }
  
  func timerFired () {
    performUpdateFunction(self.fireBlock)
  }
  
  private func performUpdateFunction (block :FireBlock) {
    if let updateBlock = block {
      updateBlock()
    }
  }
  
  public func stopTimer () {
    if self.isValid {
      self.timer.invalidate()
    }
  }
  
  public var isValid :Bool {
    get{
      return self.timer.valid
    }
  }
  
}