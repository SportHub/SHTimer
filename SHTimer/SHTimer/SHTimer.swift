import Foundation
import UIKit

public typealias FireBlock = (() -> Void)

public class SHTimer {
  
  private var timer: Timer!
  private var fireBlock: FireBlock!
  
  public class func start(duration: Float,
                          repeats: Bool = false,
                          block: @escaping FireBlock) -> SHTimer {
    let timer = SHTimer(fireBlock: block)
    timer.start(duration: duration,
                repeats: repeats)
    return timer
  }
  
  private init(fireBlock :@escaping FireBlock)  {
    self.fireBlock = fireBlock
  }
  
  private func start(duration: Float,
                     repeats: Bool = false) {
    self.timer = Timer.scheduledTimer(timeInterval: Double(duration),
                                      target: self,
                                      selector: #selector(SHTimer.timerFired),
                                      userInfo: nil,
                                      repeats: repeats)
  }
  
  @objc private func timerFired() {
    self.fireBlock()
  }
  
  public func stop() {
    if self.isValid {
      self.timer.invalidate()
    }
  }
  
  public var isValid: Bool {
    get{
      return self.timer.isValid
    }
  }
  
}
