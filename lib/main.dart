import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Désactive la bannière debug
      home: HomeProPage(), // Définit la page d'accueil comme HomeProPage
    );
  }
}

// Page Home Pro
class HomeProPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Pro Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigation vers la page de sélection de pays
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CountryPage()),
            );
          },
          child: Text('Welcome'),
        ),
      ),
    );
  }
}

// Page de sélection du pays
class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  String selectedCountry = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sélectionnez votre pays'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choisissez votre pays:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedCountry = 'Tunisie';
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CardPage(
                      selectedCountry: selectedCountry,
                    ),
                  ),
                );
              },
              child: Text('Tunisie'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedCountry = 'France';
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CardPage(
                      selectedCountry: selectedCountry,
                    ),
                  ),
                );
              },
              child: Text('France'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedCountry = 'Italie';
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CardPage(
                      selectedCountry: selectedCountry,
                    ),
                  ),
                );
              },
              child: Text('Italie'),
            ),
          ],
        ),
      ),
    );
  }
}

// Page de sélection de la carte bancaire
class CardPage extends StatefulWidget {
  final String selectedCountry;

  CardPage({required this.selectedCountry});

  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  String selectedCard = '';

  void navigateToResult() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(
          selectedCountry: widget.selectedCountry,
          selectedCard: selectedCard,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sélectionnez votre carte bancaire'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choisissez votre carte bancaire:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedCard = 'Visa';
                });
                navigateToResult();
              },
              child: Text('Visa'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedCard = 'MasterCard';
                });
                navigateToResult();
              },
              child: Text('MasterCard'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedCard = 'American Express';
                });
                navigateToResult();
              },
              child: Text('American Express'),
            ),
          ],
        ),
      ),
    );
  }
}

// Page de résultat final
class ResultPage extends StatelessWidget {
  final String selectedCountry;
  final String selectedCard;
  final int score;

  ResultPage({required this.selectedCountry, required this.selectedCard})
      : score = _calculateScore(selectedCountry, selectedCard);

  static int _calculateScore(String country, String card) {
    int countryScore = 0;
    int cardScore = 0;

    switch (country) {
      case 'Tunisie':
        countryScore = 10;
        break;
      case 'France':
        countryScore = 20;
        break;
      case 'Italie':
        countryScore = 15;
        break;
    }

    switch (card) {
      case 'Visa':
        cardScore = 5;
        break;
      case 'MasterCard':
        cardScore = 8;
        break;
      case 'American Express':
        cardScore = 12;
        break;
    }

    return countryScore + cardScore;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Résultat final'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Vous avez sélectionné:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Pays: $selectedCountry, Carte: $selectedCard',
              style: TextStyle(fontSize: 16, color: Colors.green),
            ),
            SizedBox(height: 20),
            Text(
              'Score final: $score',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Retourner à la page d'accueil
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text('Retour à l\'accueil'),
            ),
          ],
        ),
      ),
    );
  }
}
