# Aria2c-dart



## Features
1. Connect to an aria2 jsonrpc server, control the aria2 downloader remotely.
2. Support http, websocket.
3. Support secret authentication


## Getting started

```
flutter pub add aria2
```

## Usage
You can use this package like this:

```dart
import 'package:aria2c/aria2c.dart';
Aria2cWebSocketRPC rpc = Aria2cWebSocketRPC(Uri.parse('ws://127.0.0.1:6800/jsonrpc'), rpcSecret: '123456789');
await rpc.connect();
Aria2cResult result = await rpc.addUri('https://example.com/file.zip',{
    'dir':'/path/to/save',
    'out':'file.zip'
});
String gid = result.gid;
Aria2cStatusResult downloadStatus = await rpc.tellStatus(gid);
```

## Additional information

If you have any usage problem ,please tell me in the Issues.
