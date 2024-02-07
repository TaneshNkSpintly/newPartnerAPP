class ConfigDetails {
  final String name;
  final int value;
  final Map<String, bool> formOptions;
  final Map<String, List<String>> validSerials;
  final Map<String, dynamic> lockingMech;

  ConfigDetails({
    required this.name,
    required this.value,
    required this.formOptions,
    required this.validSerials,
    required this.lockingMech,
  });
}

class LockingMechanism {
  final dynamic emMagLock;
  final dynamic strikeLock;
  final dynamic boomBarierSlidingGate;
  final dynamic flapTurnstileBarriers;

  LockingMechanism({
    required this.emMagLock,
    required this.strikeLock,
    required this.boomBarierSlidingGate,
    required this.flapTurnstileBarriers,
  });

  Map<String, dynamic> toMap() {
    return {
      'emMagLock': emMagLock,
      'strikeLock': strikeLock,
      'boomBarierSlidingGate': boomBarierSlidingGate,
      'flapTurnstileBarriers': flapTurnstileBarriers,
    };
  }
}

const emMagLock = {
  'name': 'Door with mag lock',
  'value': 1,
  'relayTime': 6,
};

const strikeLock = {
  'name': 'Door with strike lock',
  'value': 2,
  'relayTime': 6,
};

const boomBarierSlidingGate = {
  'name': 'Boom Barrier or Sliding Gate',
  'value': 3,
  'relayTime': 2,
};

const flapTurnstileBarriers = {
  'name': 'Flap or Turnstile Barrier',
  'value': 4,
  'relayTime': 2,
};

final LockingMechanism lockingMech = LockingMechanism(
  emMagLock: emMagLock,
  strikeLock: strikeLock,
  boomBarierSlidingGate: boomBarierSlidingGate,
  flapTurnstileBarriers: flapTurnstileBarriers,
);

final List<ConfigDetails> retrofitType1Configs = [
  ConfigDetails(
    name: 'Entry reader and REX',
    value: 2,
    formOptions: {
      'entry': true,
      'exit': false,
      'control': false,
      'lockingMechanism': false,
      'relayTime': false,
      'attendanceAvailable': false,
    },
    validSerials: {
      'entry': ['1028', '1029', '1001', '101F', '1023', '1028', '1033', '1034'],
      'exit': [],
      'control': [],
    },
    lockingMech: lockingMech.toMap(),
  ),
  ConfigDetails(
    name: 'Entry and Exit reader',
    value: 1,
    formOptions: {
      'entry': true,
      'exit': true,
      'control': false,
      'lockingMechanism': false,
      'relayTime': false,
      'attendanceAvailable': false,
    },
    validSerials: {
      'entry': ['1028', '1029', '1001', '101F', '1023', '1028', '1033', '1034'],
      'exit': ['1028', '1029', '1001', '101F', '1023', '1028', '1033', '1034'],
      'control': [],
    },
    lockingMech: {
      'emMagLock': 'emMagLock',
      'strikeLock': 'strikeLock',
      'boomBarierSlidingGate': 'boomBarierSlidingGate',
    },
  ),
];

final List<ConfigDetails> newInstallConfigs = [
  ConfigDetails(
    name: 'Entry + Exit reader (RS485 Disabled)',
    value: 1,
    formOptions: {
      'entry': true,
      'exit': true,
      'control': false,
      'lockingMechanism': true,
      'relayTime': true,
      'attendanceAvailable': true,
    },
    validSerials: {
      'entry': [
        '1001',
        '1002',
        '1015',
        '101F',
        '1023',
        '1024',
        '1025',
        '1028',
        '1029',
        '1033',
        '1034',
        '1038',
      ],
      'exit': [
        '1001',
        '1002',
        '1015',
        '101F',
        '1023',
        '1024',
        '1025',
        '1028',
        '1029',
        '1033',
        '1034',
        '1038',
      ],
      'control': [],
    },
    lockingMech: lockingMech.toMap(),
  ),
  ConfigDetails(
    name: 'Entry + Exit reader (RS485 Enabled)',
    value: 7,
    formOptions: {
      'entry': true,
      'exit': true,
      'control': false,
      'lockingMechanism': true,
      'relayTime': true,
      'attendanceAvailable': true,
    },
    validSerials: {
      'entry': ['1028', '1029', '1001'],
      'exit': ['1028', '1029', '1001'],
      'control': [],
    },
    lockingMech: lockingMech.toMap(),
  ),
  ConfigDetails(
    name: 'Entry reader and REX',
    value: 2,
    formOptions: {
      'entry': true,
      'exit': false,
      'control': false,
      'lockingMechanism': true,
      'relayTime': true,
      'attendanceAvailable': false,
    },
    validSerials: {
      'entry': [
        '1001',
        '1002',
        '1015',
        '101F',
        '1023',
        '1024',
        '1025',
        '1028',
        '1029',
        '1033',
        '1034',
        '1038',
      ],
      'exit': [],
      'control': [],
    },
    lockingMech: {
      'emMagLock': 'emMagLock',
      'strikeLock': 'strikeLock',
      'boomBarierSlidingGate': 'boomBarierSlidingGate',
      'flapTurnstileBarriers': 'flapTurnstileBarriers',
    },
  ),
  ConfigDetails(
    name: 'Clock-in device',
    value: 5,
    formOptions: {
      'entry': true,
      'exit': false,
      'control': false,
      'lockingMechanism': false,
      'relayTime': false,
      'attendanceAvailable': false,
    },
    validSerials: {
      'entry': [
        '1001',
        '1015',
        '101F',
        '1023',
        '1024',
        '1025',
        '1028',
        '1029',
        '1033',
        '1034'
      ],
      'exit': [],
      'control': [],
    },
    lockingMech: {},
  ),
  ConfigDetails(
    name: 'Door Lock',
    value: 6,
    formOptions: {
      'entry': true,
      'exit': false,
      'control': false,
      'lockingMechanism': false,
      'relayTime': true,
      'attendanceAvailable': false,
    },
    validSerials: {
      'entry': ['1016', '1021', '1026', '1032'],
      'exit': [],
      'control': [],
    },
    lockingMech: {},
  ),
];

List<String> installMethodTypeGolbal = [
  "New install",
  "Retrofit Type 1",
  "Retrofit Type 2"
];

List<String> configurationTypeGolbal = [
  "Entry + Exit reader ",
  "Entry reader and REX",
  "3",
  "4",
  "Clock-in device",
  "Door Lock",
  "Entry + Exit reader (RS485 Enabled)",
  "8",
];
 List<String> LockingMechanismGolbal= [
    "Door with Mag Lock",
    "Door with Strike Lock",
    "Boom Barrier or Sliding Gate",
    "Flap or Turnstile Barriers",
  ];

   List<String> DeviceTypeGolbal= [
    "Entry",
    "Exit",
    "",
    "",
  ];
// List<int> installMethodValue = [1, 2, 3];
