# budgetlab

A new Flutter project.

## Team Members

### Utpal Gaurav
### Avinash Rao
### Renu Sri
### Sugata Kar
### Yukta Pandey


flutter pub run build_runner watch --delete-conflicting-outputs 

flutter clean

flutter pub get


var budget = Budget(repeats: "yea", amount: 100);

    WidgetsFlutterBinding.ensureInitialized();
    final store = await openStore();
    final userBox = store.box<Budget>();
    // If id exists updates the object else creates new object
    userBox.put(budget);
    print("xxxxxxxxx");
    print(userBox.getAll());
    store.close();
