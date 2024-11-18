// user_repository.dart
import 'package:hookee/features/home/data/models/user_model.dart';

class UserRepository {
  List<User> getUsers() {
    return [
      User(
        city: 'Nairobi',
        country: 'Kenya',
        id: 1,
        name: 'Alexa',
        age: 24,
        profession: 'UI/UX Designer',
        imageUrl:
            'https://www.ukmodels.co.uk/wp-content/uploads/2020/10/shutterstock_136135856-1024x694.jpg',
        bio:
            "I'm passionate about creating beautiful and functional user experiences. Love exploring new cultures through food and photography.",
        hobbies: [
          'Photography 📸',
          'Food Tasting 🍜',
          'Urban Sketching ✏️',
          'Yoga 🧘‍♀️',
          'Jazz Dancing 💃'
        ],
      ),
      User(
        city: 'Nairobi',
        country: 'Kenya',
        id: 2,
        name: 'Sophie',
        age: 23,
        profession: 'Software Engineer',
        imageUrl:
            'https://wallpapers.com/images/hd/young-female-model-black-outfit-9pkvtmom688tos4e.jpg',
        bio:
            "Tech enthusiast by day, rock climbing enthusiast by night. Looking for someone who can keep up with my adventurous spirit!",
        hobbies: [
          'Rock Climbing 🧗‍♀️',
          'Code Gaming 👩‍💻',
          'Piano Playing 🎹',
          'Craft Beer Tasting 🍺',
          'Hiking 🏔️'
        ],
      ),
      User(
        city: 'Nairobi',
        country: 'Kenya',
        id: 3,
        name: 'Kev',
        age: 25,
        profession: 'Digital Marketing Manager',
        imageUrl:
            'https://static.vecteezy.com/system/resources/previews/030/557/451/large_2x/ai-generative-portrait-of-handsome-male-model-fashion-background-banner-with-copy-space-text-commercial-template-free-photo.jpg',
        bio:
            "Creative soul with a passion for storytelling. Always seeking new adventures and authentic connections.",
        hobbies: [
          'Salsa Dancing 💃',
          'Wine Tasting 🍷',
          'Pottery Making 🏺',
          'Surfing 🏄‍♀️',
          'Poetry Writing ✍️'
        ],
      ),
      User(
        city: 'Nairobi',
        country: 'Kenya',
        id: 4,
        name: 'Isabella',
        age: 26,
        profession: 'Environmental Scientist',
        imageUrl:
            'https://www.ukmodels.co.uk/wp-content/uploads/2020/10/shutterstock_136135856-1024x694.jpg',
        bio:
            "Nature lover and sustainability advocate. Looking for someone who shares my passion for making the world a better place.",
        hobbies: [
          'Gardening 🌱',
          'Bird Watching 🦜',
          'Eco-Volunteering 🌍',
          'Kayaking 🛶',
          'Botanical Drawing 🎨'
        ],
      ),
      User(
        city: 'Nairobi',
        country: 'Kenya',
        id: 5,
        name: 'Mia',
        age: 24,
        profession: 'Chef',
        imageUrl:
            'https://media.istockphoto.com/id/1411160666/photo/confident-female-with-bold-personality-and-cool-attitude-portrait-of-an-edgy-young-woman.jpg?s=612x612&w=0&k=20&c=qfAQM7x5YwXDayf04bmq7SHsqUWlZP-gA6cO4pKaGcc=',
        bio:
            "Culinary artist with a taste for adventure. Let's explore the world one dish at a time!",
        hobbies: [
          'Cooking 👩‍🍳',
          'Food Photography 📸',
          'Farmers Market Shopping 🥬',
          'Tea Ceremony 🍵',
          'Foraging 🍄'
        ],
      ),
      User(
        city: 'Nairobi',
        country: 'Kenya',
        id: 6,
        name: 'Luna',
        age: 27,
        profession: 'Astronomy Professor',
        imageUrl:
            'https://media.istockphoto.com/id/1366225011/photo/beauty-portrait-of-african-american-girl-with-afro-hair.jpg?s=612x612&w=0&k=20&c=inR3a70AHtkLIghIrnwiWpYb1FQ5nd3Rzcf-OD8URo4=',
        bio:
            "Star gazer and space enthusiast. Looking for someone to share cosmic adventures with.",
        hobbies: [
          'Stargazing 🔭',
          'Astrophotography ⭐',
          'Sci-Fi Reading 📚',
          'Space Model Building 🚀',
          'Desert Camping 🏕️'
        ],
      ),
      User(
        city: 'Nairobi',
        country: 'Kenya',
        id: 7,
        name: 'Nick',
        age: 25,
        profession: 'Music Producer',
        imageUrl:
            'https://www.mavnmodels.com/wp-content/uploads/2023/12/2020-05-11_2306818852301650671-819x1024.jpg',
        bio: "Creating beats and chasing dreams. Music is my language of love.",
        hobbies: [
          'DJing 🎧',
          'Vinyl Collecting 📀',
          'Guitar Playing 🎸',
          'Music Festival Hopping 🎪',
          'Sound Design 🎼'
        ],
      ),
      User(
        city: 'Nairobi',
        country: 'Kenya',
        id: 8,
        name: 'Ruby',
        age: 23,
        profession: 'Professional Athlete',
        imageUrl:
            'https://www.africanprintinfashion.com/wp-content/uploads/2015/04/malaika-firth-by-jean-baptiste-mondino-apif-march-2015_2.jpg',
        bio:
            "Former Olympic swimmer turned yoga instructor. Teaching others to find their inner peace through movement.",
        hobbies: [
          'Swimming 🏊‍♀️',
          'Meditation 🧘‍♀️',
          'Beach Volleyball 🏐',
          'Acrobatic Yoga 🤸‍♀️',
          'Smoothie Making 🥤'
        ],
      ),
    ];
  }
}
