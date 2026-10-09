import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  @override
  State<Calendar> createState() => CalendarState();
}

class CalendarState extends State<Calendar> {
  Locale locale = Locale('ru');

  void toggleLang() {
    setState(() {
      locale = locale.languageCode == 'ru' ? Locale('en') : Locale('ru');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: locale,
      supportedLocales: [Locale('ru'), Locale('en')],
      localizationsDelegates: [GlobalMaterialLocalizations.delegate],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.tealAccent),
      home: CalendarPage(onToggleLang: toggleLang),
    );
  }
}

class CalendarPage extends StatefulWidget {
  final VoidCallback onToggleLang;

  CalendarPage({super.key, required this.onToggleLang});

  @override
  State<CalendarPage> createState() => CalendarPageState();
}

class CalendarPageState extends State<CalendarPage> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  final Map<DateTime, List<String>> events = {};

  List<String> _getEventsForDay(DateTime day) {
    final key = DateTime(day.year, day.month, day.day);
    return events[key] ?? [];
  }

  void _deleteEvent(int index) {
    final key = DateTime(
      _selectedDay.year,
      _selectedDay.month,
      _selectedDay.day,
    );

    setState(() {
      final dayEvents = events[key];
      if (dayEvents == null) return;

      dayEvents.removeAt(index);
      if (dayEvents.isEmpty) {
        events.remove(key);
      }
    });
  }

  Future<void> _showEventDialog({int? eventIndex}) async {
    final controller = TextEditingController();
    if (eventIndex != null) {
      controller.text = _getEventsForDay(_selectedDay)[eventIndex];
    }

    await showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          eventIndex == null ? 'Новое событие' : 'Редактировать событие',
        ),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: 'Введите название события'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Отменена'),
          ),
          ElevatedButton(
            onPressed: () {
              final title = controller.text.trim();
              if (title.isNotEmpty) {
                final key = DateTime(
                  _selectedDay.year,
                  _selectedDay.month,
                  _selectedDay.day,
                );
                setState(() {
                  if (eventIndex == null) {
                    events.putIfAbsent(key, () => []);
                    events[key]!.add(title);
                  } else {
                    events[key]![eventIndex] = title;
                  }
                });
              }
              Navigator.pop(context);
            },
            child: Text(eventIndex == null ? 'Добавить' : 'Сохранить'),
          ),
        ],
      ),
    );
    controller.dispose();
  }

  void editEvent(int index) {
    final key = DateTime(
      _selectedDay.year,
      _selectedDay.month,
      _selectedDay.day,
    );

    final controller = TextEditingController(text: events[key]![index]);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Редактировать событие'),
        content: TextField(controller: controller),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Отмена'),
          ),
          ElevatedButton(
            onPressed: () {
              final newName = controller.text.trim();

              if (newName.isNotEmpty) {
                setState(() {
                  events[key]![index] = newName;
                });
              }

              Navigator.pop(context);
            },
            child: Text('Сохранить'),
          ),
        ],
      ),
    );
  }

  void addEvents() => _showEventDialog();

  @override
  Widget build(BuildContext context) {
    final _events = _getEventsForDay(_selectedDay);

    return Scaffold(
      appBar: AppBar(
        title: Text('Календарь'),
        actions: [
          IconButton(
            onPressed: widget.onToggleLang,
            icon: Icon(Icons.language),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addEvents,
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2020),
            lastDay: DateTime.utc(2026, 12, 31),
            selectedDayPredicate: (day) {
              return isSameDay(day, _selectedDay);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            eventLoader: _getEventsForDay,
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
              markerDecoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            Localizations.localeOf(context).languageCode == 'ru'
                ? 'Выбрано: ${_selectedDay.day}.${_selectedDay.month}.${_selectedDay.year}'
                : 'Selected: ${_selectedDay.day}/${_selectedDay.month}/${_selectedDay.year}',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Expanded(
            child: _events.isEmpty
                ? Center(
                    child: Text(
                      Localizations.localeOf(context).languageCode == 'ru'
                          ? 'Событий нет'
                          : 'No Events',
                    ),
                  )
                : ListView.builder(
                    itemCount: _events.length,
                    itemBuilder: (_, index) => Card(
                      child: ListTile(
                        leading: Icon(Icons.event),
                        title: Text(_events[index]),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              tooltip: 'Редактировать событие',
                              onPressed: () =>
                                  _showEventDialog(eventIndex: index),
                              icon: Icon(Icons.edit_outlined),
                            ),
                            IconButton(
                              tooltip: 'Удалить событие',
                              onPressed: () => _deleteEvent(index),
                              icon: Icon(Icons.delete_outline),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
