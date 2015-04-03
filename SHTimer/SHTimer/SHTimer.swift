import UIKit

public typealias FireBlock = (() -> Void)

public class SHTimer: NSObject {
  
  var timer :NSTimer!
  var fireBlock :FireBlock!
  
  public class func startTimeWithDurtion (duration :Float, repeats :Bool, fireBlock :FireBlock) -> SHTimer {
    let timer = SHTimer(fireBlock: fireBlock)
    timer.startTimeWithDurtion(duration, repeats: repeats)
    return timer
  }
  
  private init(fireBlock :FireBlock)  {
    self.fireBlock = fireBlock
    super.init()
  }
  
  private func startTimeWithDurtion(duration :Float, repeats :Bool) {
    self.timer = NSTimer.scheduledTimerWithTimeInterval(Double(duration), target: self,
                                                                        selector: Selector("timerFired"),
                                                                        userInfo: nil,
                                                                         repeats: repeats)
  }
  
  func timerFired() {
    self.fireBlock()
  }
  
  public func stopTimer() {
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