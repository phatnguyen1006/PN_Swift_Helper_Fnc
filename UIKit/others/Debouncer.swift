// Embed: <script src="https://gist.github.com/samarth4487/3525206a0b8ce9ec74927d12d3e167bd.js"></script>
// Src: https://gist.github.com/samarth4487/3525206a0b8ce9ec74927d12d3e167bd

public class Debouncer {
    
    private let timeInterval: TimeInterval
    private var timer: Timer?
    
    typealias Handler = () -> Void
    var handler: Handler?
    
    init(timeInterval: TimeInterval) {
        self.timeInterval = timeInterval
    }
    
    public func renewInterval() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: false, block: { [weak self] (timer) in
            self?.timeIntervalDidFinish(for: timer)
        })
    }
    
    @objc private func timeIntervalDidFinish(for timer: Timer) {
        guard timer.isValid else {
            return
        }
        
        handler?()
        handler = nil
    }
    
}
