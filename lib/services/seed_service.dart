import '../models/trip.dart';
import '../models/expense.dart';
import '../models/moment.dart';
import 'database_service.dart';

class SeedService {
  static Future<void> seedDatabase() async {
    final db = DatabaseService.instance;
    final trips = await db.getTripsByStatus('upcoming');
    if (trips.isNotEmpty) return; // Only seed if empty

    // 1. Tokyo Trip
    final tokyoId = await db.createTrip(Trip(
      destination: 'Tokyo, Japan',
      startDate: '2024-05-10',
      endDate: '2024-05-20',
      notes: 'Cherry blossom season and neon lights!',
      status: 'upcoming',
      budget: 3500.0,
      stops: ['Shinjuku Gyoen', 'Akihabara', 'Tsukiji Outer Market', 'TeamLab Borderless'],
    ));

    await db.createExpense(Expense(tripId: tokyoId, title: 'Flight (JAL)', amount: 1200.0, date: '2024-01-15T10:00:00'));
    await db.createExpense(Expense(tripId: tokyoId, title: 'Hotel Sunroute', amount: 850.0, date: '2024-01-20T12:00:00'));
    await db.createMoment(Moment(tripId: tokyoId, note: 'Found the best ramen in a hidden alley!', timestamp: '2024-05-12T19:00:00'));

    // 2. Paris Trip
    final parisId = await db.createTrip(Trip(
      destination: 'Paris, France',
      startDate: '2024-07-15',
      endDate: '2024-07-22',
      notes: 'Art, history, and pastries.',
      status: 'upcoming',
      budget: 2800.0,
      stops: ['Eiffel Tower', 'Louvre Museum', 'Montmartre', 'Palace of Versailles'],
    ));

    await db.createExpense(Expense(tripId: parisId, title: 'Louvre Tickets', amount: 45.0, date: '2024-02-10T09:00:00'));
    await db.createMoment(Moment(tripId: parisId, note: 'Sunset at the Seine was magical.', timestamp: '2024-07-16T21:00:00'));

    // 3. New York Trip
    await db.createTrip(Trip(
      destination: 'New York City, USA',
      startDate: '2023-12-20',
      endDate: '2023-12-28',
      notes: 'Christmas in the Big Apple.',
      status: 'past',
      budget: 4000.0,
      stops: ['Times Square', 'Central Park', 'Empire State Building', 'Brooklyn Bridge'],
    ));
  }
}
