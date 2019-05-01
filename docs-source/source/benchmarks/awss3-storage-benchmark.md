## AWS S3 File Storage

Benchmark results for AWS S3 File storage under cloudmesh-storage.

 PING ms : 3
 DOWNLOAD Mbps : 46.86
 UPLOAD Mbps : 35.13

```
+------------------+----------------------------------------------------+
| Machine Arribute | Time/s                                             |
+------------------+----------------------------------------------------+
| mac_version      |                                                    |
| machine          | AMD64                                              |
| node             | DESKTOP-CNS55VM                                    |
| platform         | Windows-10-10.0.17134-SP0                          |
| processor        | Intel64 Family 6 Model 78 Stepping 3, GenuineIntel |
| processors       | Windows                                            |
| release          | 10                                                 |
| sys              | win32                                              |
| system           | Windows                                            |
| version          | 10.0.17134                                         |
| win_version      | ('10', '10.0.17134', 'SP0', 'Multiprocessor Free') |
+------------------+----------------------------------------------------+
+---------------------------------+-------+-----------------+---------+-------------+------------------------------------------+
| timer                           | time  | node            | system  | mac_version | win_version                              |
+---------------------------------+-------+-----------------+---------+-------------+------------------------------------------+
| PUT file                        | 0.25  | DESKTOP-CNS55VM | Windows |             | ('10', '10.0.17134', 'SP0',              |
|                                 |       |                 |         |             | 'Multiprocessor Free')                   |
| GET file                        | 0.38  | DESKTOP-CNS55VM | Windows |             | ('10', '10.0.17134', 'SP0',              |
|                                 |       |                 |         |             | 'Multiprocessor Free')                   |
| LIST Directory                  | 0.42  | DESKTOP-CNS55VM | Windows |             | ('10', '10.0.17134', 'SP0',              |
|                                 |       |                 |         |             | 'Multiprocessor Free')                   |
| CREATE DIR                      | 0.35  | DESKTOP-CNS55VM | Windows |             | ('10', '10.0.17134', 'SP0',              |
|                                 |       |                 |         |             | 'Multiprocessor Free')                   |
| SEARCH file                     | 0.35  | DESKTOP-CNS55VM | Windows |             | ('10', '10.0.17134', 'SP0',              |
|                                 |       |                 |         |             | 'Multiprocessor Free')                   |
| DELETE Directory                | 0.4   | DESKTOP-CNS55VM | Windows |             | ('10', '10.0.17134', 'SP0',              |
|                                 |       |                 |         |             | 'Multiprocessor Free')                   |
| PUT Directory --recursive       | 22.78 | DESKTOP-CNS55VM | Windows |             | ('10', '10.0.17134', 'SP0',              |
|                                 |       |                 |         |             | 'Multiprocessor Free')                   |
| GET Directory --recursive       | 24.23 | DESKTOP-CNS55VM | Windows |             | ('10', '10.0.17134', 'SP0',              |
|                                 |       |                 |         |             | 'Multiprocessor Free')                   |
| DELETE Sub-directory            | 0.61  | DESKTOP-CNS55VM | Windows |             | ('10', '10.0.17134', 'SP0',              |
|                                 |       |                 |         |             | 'Multiprocessor Free')                   |
| LIST Directory --recursive      | 8.4   | DESKTOP-CNS55VM | Windows |             | ('10', '10.0.17134', 'SP0',              |
|                                 |       |                 |         |             | 'Multiprocessor Free')                   |
| LIST Sub-directory --recursive  | 0.71  | DESKTOP-CNS55VM | Windows |             | ('10', '10.0.17134', 'SP0',              |
|                                 |       |                 |         |             | 'Multiprocessor Free')                   |
| SEARCH file --recursive         | 0.84  | DESKTOP-CNS55VM | Windows |             | ('10', '10.0.17134', 'SP0',              |
|                                 |       |                 |         |             | 'Multiprocessor Free')                   |
| SEARCH file under a sub-dir --r | 0.28  | DESKTOP-CNS55VM | Windows |             | ('10', '10.0.17134', 'SP0',              |
|                                 |       |                 |         |             | 'Multiprocessor Free')                   |
| SEARCH file under root dir --r  | 0.53  | DESKTOP-CNS55VM | Windows |             | ('10', '10.0.17134', 'SP0',              |
|                                 |       |                 |         |             | 'Multiprocessor Free')                   |
+---------------------------------+-------+-----------------+---------+-------------+------------------------------------------+
```
