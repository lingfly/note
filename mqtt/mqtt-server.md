Server
```go
type Server struct {
	l             net.Listener
	subs          *subscriptions
	stats         *stats
	Done          chan struct{}
	StatsInterval time.Duration // Defaults to 10 seconds. Must be set using sync/atomic.StoreInt64().
	Dump          bool          // When true, dump the messages in and out.
	rand          *rand.Rand
}
```