# Catalog facts for scorers (computed from the raw catalogs; the only ground truth)

## Qiaojia-Dongchuan

```
GROUND TRUTH for the ingested Qiaojia-Dongchuan catalog (the only data the question refers to):
- total events: 5218
- time span: 2022-08-23 01:30:50 to 2023-03-17 14:22:01 (206.5 days)
- latitude 26.01 to 27.474; longitude 102.509 to 103.477 (about 162.9 km N-S x 96.0 km E-W)
- depth 0.19-68.82 km, mean 12.26 km, median 12.55 km; counts by interval (km): {'0-5': 552, '5-10': 1177, '10-15': 2081, '15-20': 1038, '20-30': 325, '>30': 45}
- magnitude M-0.91 to M4.18, mean M1.4, median M1.35, std 0.5; histogram: {'[-10,0)': 20, '[0,1)': 945, '[1,2)': 3700, '[2,3)': 523, '[3,4)': 28, '[4,5)': 2}
- events with M>=3: 30; with 2.0<=M<=3.0: 523; with M<1: 965 (18.5%)
- largest event: 2022-10-18 22:12:35 M4.18 (27.005, 102.881) depth 2.6 km
- top 5 by magnitude: 2022-10-18 22:12:35 M4.18 (27.005, 102.881) depth 2.6 km | 2022-10-14 19:56:35 M4.06 (27.029, 103.013) depth 8.7 km | 2022-10-14 20:03:09 M3.90 (26.952, 103.011) depth 5.1 km | 2023-02-01 19:21:42 M3.74 (27.017, 102.844) depth 12.1 km | 2022-11-13 21:06:29 M3.71 (27.024, 102.887) depth 4.4 km
- deepest: 2022-11-26 13:53:44 M1.49 (27.081, 103.216) depth 68.8 km; shallowest: 2022-11-11 14:52:47 M2.05 (26.857, 102.922) depth 0.2 km
- busiest day: 2023-03-08 (169 events); second: 2023-03-10 (158); busiest month: 2022-12 (1505); busiest ISO week: 2023-03-06/2023-03-12 (730)
- quietest day with events: 2022-10-07 (2); zero-event days inside span: 0
- mean rate: 25.26 events/day
- monthly counts: {'2022-08': 53, '2022-09': 409, '2022-10': 637, '2022-11': 463, '2022-12': 1505, '2023-01': 732, '2023-02': 525, '2023-03': 894}
- yearly counts: {'2022': 3067, '2023': 2151}
- first half (to 2022-12-04): 1732 events, max M4.18, mean depth 12.13 km; second half: 3486 events, max M3.74, mean depth 12.33 km
- first calendar month 2022-08: 53 events; last calendar month 2023-03: 894 events
- events within 24 h after the largest event: 27; within 5 km of its epicenter: 443
- magnitude-depth correlation: Pearson r 0.067
```

## 2019 Ridgecrest

```
GROUND TRUTH for the ingested 2019 Ridgecrest catalog (the only data the question refers to):
- total events: 4188
- time span: 2019-07-04 17:02:55 to 2019-07-16 23:43:03 (12.3 days)
- latitude 35.475 to 36.013; longitude -117.818 to -117.256 (about 59.8 km N-S x 50.7 km E-W)
- depth 0.16-239.53 km, mean 6.58 km, median 5.44 km; counts by interval (km): {'0-5': 1930, '5-10': 1665, '10-15': 513, '15-20': 23, '20-30': 23, '>30': 34}
- magnitude M2.0 to M7.1, mean M2.53, median M2.38, std 0.51; histogram: {'[2,3)': 3502, '[3,4)': 623, '[4,5)': 57, '[5,6)': 4, '[6,7)': 1, '[7,10)': 1}
- events with M>=3: 686; with 2.0<=M<=3.0: 3524; with M<1: 0 (0.0%)
- largest event: 2019-07-06 03:19:52 M7.10 (35.772, -117.594) depth 3.2 km
- top 5 by magnitude: 2019-07-06 03:19:52 M7.10 (35.772, -117.594) depth 3.2 km | 2019-07-04 17:33:48 M6.40 (35.708, -117.499) depth 15.1 km | 2019-07-06 03:47:53 M5.50 (35.905, -117.745) depth 6.0 km | 2019-07-06 04:18:55 M5.44 (35.905, -117.684) depth 13.8 km | 2019-07-06 03:23:50 M5.37 (35.790, -117.598) depth 12.8 km
- deepest: 2019-07-06 14:04:56 M2.23 (35.753, -117.563) depth 239.5 km; shallowest: 2019-07-04 19:49:04 M3.18 (35.685, -117.489) depth 0.2 km
- busiest day: 2019-07-06 (1797 events); second: 2019-07-07 (562); busiest month: 2019-07 (4188); busiest ISO week: 2019-07-01/2019-07-07 (2996)
- quietest day with events: 2019-07-15 (57); zero-event days inside span: 0
- mean rate: 341.1 events/day
- monthly counts: {'2019-07': 4188}
- yearly counts: {'2019': 4188}
- first half (to 2019-07-10): 3615 events, max M7.1, mean depth 6.62 km; second half: 573 events, max M4.9, mean depth 6.3 km
- first calendar month 2019-07: 4188 events; last calendar month 2019-07: 4188 events
- events within 24 h after the largest event: 1890; within 5 km of its epicenter: 419
- magnitude-depth correlation: Pearson r 0.065
```

## 2021 Maduo

```
GROUND TRUTH for the ingested 2021 Maduo catalog (the only data the question refers to):
- total events: 10621
- time span: 2021-06-01 07:25:33 to 2023-06-08 20:38:50 (737.6 days)
- latitude 33.753 to 35.383; longitude 97.348 to 99.471 (about 181.3 km N-S x 194.2 km E-W)
- depth 0.09-18.63 km, mean 10.29 km, median 10.76 km; counts by interval (km): {'0-5': 488, '5-10': 3693, '10-15': 6282, '15-20': 158, '20-30': 0, '>30': 0}
- magnitude M0.5 to M4.7, mean M0.86, median M0.7, std 0.47; histogram: {'[0,1)': 7749, '[1,2)': 2472, '[2,3)': 335, '[3,4)': 59, '[4,5)': 6}
- events with M>=3: 65; with 2.0<=M<=3.0: 347; with M<1: 7749 (73.0%)
- largest event: 2021-07-08 13:23:23 M4.70 (34.717, 97.984) depth 10.6 km
- top 5 by magnitude: 2021-07-08 13:23:23 M4.70 (34.717, 97.984) depth 10.6 km | 2021-08-10 22:35:56 M4.70 (34.635, 98.313) depth 10.9 km | 2021-06-03 05:55:16 M4.30 (34.708, 97.893) depth 14.2 km | 2021-07-06 01:50:51 M4.20 (34.667, 98.268) depth 10.7 km | 2021-07-07 07:27:09 M4.20 (34.493, 98.995) depth 9.6 km
- deepest: 2022-06-14 20:31:18 M0.70 (34.973, 97.624) depth 18.6 km; shallowest: 2023-02-23 10:43:40 M0.60 (34.717, 99.100) depth 0.1 km
- busiest day: 2021-07-24 (148 events); second: 2021-06-14 (123); busiest month: 2021-06 (2425); busiest ISO week: 2021-06-14/2021-06-20 (689)
- quietest day with events: 2023-06-08 (1); zero-event days inside span: 16
- mean rate: 14.4 events/day
- monthly counts: {'2021-06': 2425, '2021-07': 1823, '2021-08': 1018, '2021-09': 613, '2021-10': 605, '2021-11': 460, '2021-12': 479, '2022-01': 353, '2022-02': 365, '2022-03': 255, '2022-04': 233, '2022-05': 188, '2022-06': 171, '2022-07': 160, '2022-08': 143, '2022-09': 204, '2022-10': 166, '2022-11': 225, '2022-12': 158, '2023-01': 158, '2023-02': 100, '2023-03': 117, '2023-04': 86, '2023-05': 97, '2023-06': 19}
- yearly counts: {'2021': 7423, '2022': 2621, '2023': 577}
- first half (to 2022-06-05): 8853 events, max M4.7, mean depth 10.23 km; second half: 1768 events, max M3.7, mean depth 10.6 km
- first calendar month 2021-06: 2425 events; last calendar month 2023-06: 19 events
- events within 24 h after the largest event: 127; within 5 km of its epicenter: 666
- magnitude-depth correlation: Pearson r -0.021
```
