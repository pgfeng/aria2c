import 'package:aria2c/aria2cWebSocketRPC.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  final Aria2cWebSocketRPC rpc;

  const Menu({super.key, required this.rpc});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String gid = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Center(child: Text('gid:$gid')),
          const SizedBox(
            height: 10,
          ),
          Wrap(
              direction: Axis.horizontal,
              spacing: 10,
              runSpacing: 10,
              children: [
                MaterialButton(
                  color: Colors.green,
                  onPressed: () async {
                    var r = await widget.rpc.getVersion();
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Get Version'),
                            content: Text(r.toString()),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Ok'))
                            ],
                          );
                        });
                  },
                  child: const Text('Get Version'),
                ),
                MaterialButton(
                  color: Colors.green,
                  onPressed: () async {
                    // 获取目录
                    var r = await widget.rpc.addUri(
                        'https://images.pexels.com/photos/27853682/pexels-photo-27853682.jpeg',
                        {
                          'out': 'test.jpg',
                          // 继续下载
                          'continue': 'true',
                          // 覆盖原文件
                          'allow-overwrite': 'true',
                        });
                    setState(() {
                      gid = r.gid;
                    });
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Add Uri'),
                            content: Text(r.toString()),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Ok'))
                            ],
                          );
                        });
                  },
                  child: const Text('Add Uri'),
                ),
                //remove
                MaterialButton(
                  color: Colors.green,
                  onPressed: () async {
                    var r = await widget.rpc.remove(gid);
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Remove'),
                            content: Text(r.toString()),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Ok'))
                            ],
                          );
                        });
                  },
                  child: const Text('Remove'),
                ),
                // forceRemove
                MaterialButton(
                  color: Colors.green,
                  onPressed: () async {
                    var r = await widget.rpc.forceRemove(gid);
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Force Remove'),
                            content: Text(r.toString()),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Ok'))
                            ],
                          );
                        });
                  },
                  child: const Text('Force Remove'),
                ),
                //pause
                MaterialButton(
                  color: Colors.green,
                  onPressed: () async {
                    var r = await widget.rpc.pause(gid);
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Pause'),
                            content: Text(r.toString()),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Ok'))
                            ],
                          );
                        });
                  },
                  child: const Text('Pause'),
                ),
                //   pauseAll
                MaterialButton(
                  color: Colors.green,
                  onPressed: () async {
                    var r = await widget.rpc.pauseAll();
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Pause All'),
                            content: Text(r.toString()),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Ok'))
                            ],
                          );
                        });
                  },
                  child: const Text('Pause All'),
                ),
                // unpause
                MaterialButton(
                  color: Colors.green,
                  onPressed: () async {
                    var r = await widget.rpc.unpause(gid);
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Unpause'),
                            content: Text(r.toString()),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Ok'))
                            ],
                          );
                        });
                  },
                  child: const Text('Unpause'),
                ),
                // unpauseAll
                MaterialButton(
                  color: Colors.green,
                  onPressed: () async {
                    var r = await widget.rpc.unpauseAll();
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Unpause All'),
                            content: Text(r.toString()),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Ok'))
                            ],
                          );
                        });
                  },
                  child: const Text('Unpause All'),
                ),
                // tellStatus
                MaterialButton(
                  color: Colors.green,
                  onPressed: () async {
                    var r = await widget.rpc.tellStatus(gid);
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Tell Status'),
                            content: Text(r.toString()),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Ok'))
                            ],
                          );
                        });
                  },
                  child: const Text('Tell Status'),
                ),
                //getUris
                MaterialButton(
                  color: Colors.green,
                  onPressed: () async {
                    var r = await widget.rpc.getUris(gid);
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Get Uris'),
                            content: Text(r.toString()),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Ok'))
                            ],
                          );
                        });
                  },
                  child: const Text('Get Uris'),
                ),
                //getFiles
                MaterialButton(
                  color: Colors.green,
                  onPressed: () async {
                    var r = await widget.rpc.getFiles(gid);
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Get Files'),
                            content: Text(r.toString()),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Ok'))
                            ],
                          );
                        });
                  },
                  child: const Text('Get Files'),
                ),
                //tellActive
                MaterialButton(
                  color: Colors.green,
                  onPressed: () async {
                    var r = await widget.rpc.tellActive();
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Tell Active'),
                            content: Text(r.toString()),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Ok'))
                            ],
                          );
                        });
                  },
                  child: const Text('Tell Active'),
                ),
                //tellWaiting
                MaterialButton(
                  color: Colors.green,
                  onPressed: () async {
                    var r = await widget.rpc.tellWaiting(0, 10);
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Tell Waiting'),
                            content: Text(r.toString()),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Ok'))
                            ],
                          );
                        });
                  },
                  child: const Text('Tell Waiting'),
                ),
                // tellStopped
                MaterialButton(
                  color: Colors.green,
                  onPressed: () async {
                    var r = await widget.rpc.tellStopped(0, 10);
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Tell Stopped'),
                            content: Text(r.toString()),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Ok'))
                            ],
                          );
                        });
                  },
                  child: const Text('Tell Stopped'),
                ),
                //getGlobalOption
                MaterialButton(
                  color: Colors.green,
                  onPressed: () async {
                    var r = await widget.rpc.getGlobalOption();
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Get Global Option'),
                            content: Text(r.toString()),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Ok'))
                            ],
                          );
                        });
                  },
                  child: const Text('Get Global Option'),
                ),
                // purgeDownloadResult
                MaterialButton(
                  color: Colors.green,
                  onPressed: () async {
                    var r = await widget.rpc.purgeDownloadResult();
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Purge Download Result'),
                            content: Text(r.toString()),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Ok'))
                            ],
                          );
                        });
                  },
                  child: const Text('Purge Download Result'),
                ),
                //removeDownloadResult
                MaterialButton(
                  color: Colors.green,
                  onPressed: () async {
                    var r = await widget.rpc.removeDownloadResult(gid);
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Remove Download Result'),
                            content: Text(r.toString()),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Ok'))
                            ],
                          );
                        });
                  },
                  child: const Text('Remove Download Result'),
                ),
                //shutdown
                MaterialButton(
                  color: Colors.green,
                  onPressed: () async {
                    var r = await widget.rpc.shutdown();
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Shutdown'),
                            content: Text(r.toString()),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Ok'))
                            ],
                          );
                        });
                  },
                  child: const Text('Shutdown'),
                ),
              ]),
        ],
      ),
    ));
  }
}
