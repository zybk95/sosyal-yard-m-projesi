class Aid < ApplicationRecord

  belongs_to :user

  geocoded_by :address
  after_validation :geocode

  #after_validation :latitude, :longitude,   presence: true

    IL=['Adana', 'Adıyaman', 'Afyon', 'Ağrı', 'Amasya', 'Ankara', 'Antalya', 'Artvin',
        'Aydın', 'Balıkesir', 'Bilecik', 'Bingöl', 'Bitlis', 'Bolu', 'Burdur', 'Bursa', 'Çanakkale',
        'Çankırı', 'Çorum', 'Denizli', 'Diyarbakır', 'Edirne', 'Elazığ', 'Erzincan', 'Erzurum', 'Eskişehir',
        'Gaziantep', 'Giresun', 'Gümüşhane', 'Hakkari', 'Hatay', 'Isparta', 'Mersin', 'İstanbul', 'İzmir',
        'Kars', 'Kastamonu', 'Kayseri', 'Kırklareli', 'Kırşehir', 'Kocaeli', 'Konya', 'Kütahya', 'Malatya',
        'Manisa', 'Kahramanmaraş', 'Mardin', 'Muğla', 'Muş', 'Nevşehir', 'Niğde', 'Ordu', 'Rize', 'Sakarya',
        'Samsun', 'Siirt', 'Sinop', 'Sivas', 'Tekirdağ', 'Tokat', 'Trabzon', 'Tunceli', 'Şanlıurfa', 'Uşak',
        'Van', 'Yozgat', 'Zonguldak', 'Aksaray', 'Bayburt', 'Karaman', 'Kırıkkale', 'Batman', 'Şırnak',
        'Bartın', 'Ardahan', 'Iğdır', 'Yalova', 'Karabük', 'Kilis', 'Osmaniye', 'Düzce']

    CATEGORY=['Düşük Gelirli Aile', 'Yaşlı Birey', 'Yetim/Öksüz', 'Köy Okulu', 'İşsiz', 'Engelli Birey']

    TYPE=['Maddi Yardım', 'Eğitim Yardımı','İlaç Yardımı','Sosyal Sorumluluk','Burs','Kitap Yardımı']


    def self.search(search)
      if search
        where("title LIKE ? OR category LIKE ? OR aid_type LIKE ? OR address LIKE ? OR needy_name LIKE ?",
        "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
      else
        all
      end
    end

    #kullanılmadı ama bir bakmak lazım mantıklı gibi duruyor
    def full_search_name
      degisken = "#{self.title} #{self.category} #{self.aid_type} #{self.explanation} #{self.address}"
    end

end
