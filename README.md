# Viva*

An Elixir API to weather observations from the Swedish Maritime Administration.

Example:

```elixir
iex(1)> Viva.get_stations
{:ok,
 [
   %Viva.Station{
     id: 169,
     latitude: 57.789774,
     longitude: 12.010189,
     name: "Agnesberg (GBG Stad)"
   },
   %Viva.Station{id: 21, latitude: 65.5697, longitude: 22.1725, name: "Ale"},
   %Viva.Station{
     id: 15,
     latitude: 58.484266,
     longitude: 16.960683,
     name: "Arkö"
   },
   %Viva.Station{id: 17, latitude: 65.5727, longitude: 22.1703, name: "Atle"},
   %Viva.Station{
     id: 25,
     latitude: 55.74588,
     longitude: 12.9168,
     name: "Barsebäck"
   },
   %Viva.Station{
     id: 141,
     latitude: 59.32078,
     longitude: 18.15478,
     name: "Blockhusudden (SH)"
   },
   %Viva.Station{
     id: 27,
     latitude: 59.0998,
     longitude: 17.67833,
     name: "Brandalsund"
   },
   %Viva.Station{
     id: 30,
     latitude: 58.34005,
     longitude: 12.351683,
     name: "Brinkebergskulle Nedre"
   },
   %Viva.Station{
     id: 31,
     latitude: 58.34102,
     longitude: 12.35092,
     name: "Brinkebergskulle Övre"
   },
   %Viva.Station{
     id: 32,
     latitude: 58.336,
     longitude: 11.4046,
     name: "Brofjorden"
   },
   %Viva.Station{
     id: 24,
     latitude: 58.34285,
     longitude: 11.40125,
     name: "Brofjorden Tavla 1"
   },
   %Viva.Station{
     id: 135,
     latitude: 58.2508,
     longitude: 11.2239,
     name: "Brofjordens Angöring"
   },
   %Viva.Station{
     id: 33,
     latitude: 60.7315,
     longitude: 17.325833,
     name: "Bönan"
   },
   %Viva.Station{
     id: 5, 
     latitude: 58.382367,
     longitude: 12.310783,
     name: "Dalbobron"
   },
   %Viva.Station{
     id: 34,
     latitude: 59.184833,
     longitude: 17.642833,
     name: "E4 Bron Södertälje"
   },
   %Viva.Station{
     id: 35,
     latitude: 60.728167,
     longitude: 17.557833,
     name: "Eggegrund"
   },
   %Viva.Station{
     id: 168,
     latitude: 57.696567,
     longitude: 11.908833, 
     name: "Eriksberg (GBG Stad)"
   },
   %Viva.Station{
     id: 119,
     latitude: 56.88462,
     longitude: 12.468391,
     name: "Falkenberg Vind"
   },
   %Viva.Station{
     id: 36,
     latitude: 56.892,
     longitude: 12.4895,
     name: "Falkenberg Vst"
   },
   %Viva.Station{
     id: 91,
     latitude: 55.56098,
     longitude: 12.809541,
     name: "Flinten 16"
   },
   %Viva.Station{
     id: 86,
     latitude: 55.589379,
     longitude: 12.844475,
     name: "Flinten 7"
   },
   %Viva.Station{
     id: 111,
     latitude: 55.518195,
     longitude: 12.744768,
     name: "Flinten SW"
   },
   %Viva.Station{
     id: 12,
     latitude: 60.408611,
     longitude: 18.210833,
     name: "Forsmark"
   },
   %Viva.Station{id: 22, latitude: 65.5718, longitude: 22.171, name: "Frej"},
   %Viva.Station{
     id: 140,
     latitude: 59.3463,
     longitude: 18.12708,
     name: "Frihamnen (SH)"
   },
   %Viva.Station{
     id: 39,
     latitude: 59.663757,
     longitude: 18.931997, 
     name: "Furusund"
   },
   %Viva.Station{
     id: 158,
     latitude: 64.915833,
     longitude: 21.230555,
     name: "Furuögrund (SMHI)"
   },
   %Viva.Station{
     id: 153,
     latitude: 62.349932,
     longitude: 17.578059,
     name: "Gubben"
   },
   %Viva.Station{
     id: 40,
     latitude: 64.6633,
     longitude: 21.3167,
     name: "Gåsören"
   },
   %Viva.Station{id: 41, latitude: 58.0983, longitude: 12.1506, name: "Göta"},
   %Viva.Station{
     id: 42,
     latitude: 57.71441,
     longitude: 11.9675,
     name: "Götaälvbron"
   },
   %Viva.Station{
     id: 43,
     latitude: 56.649783,
     longitude: 12.8425,
     name: "Halmstad"
   },
   %Viva.Station{
     id: 113,
     latitude: 57.896333,
     longitude: 11.467167,
     name: "Hamneskär"
   },
   %Viva.Station{id: 44, latitude: 60.17, longitude: 18.482, name: "Hargs Hamn"},
   %Viva.Station{
     id: 45,
     latitude: 56.041167,
     longitude: 12.6845,
     name: "Helsingborg"
   },
   %Viva.Station{
     id: 129,
     latitude: 56.018933,
     longitude: 12.697067,
     name: "Helsingborg Sydhamnen"
   },
   %Viva.Station{
     id: 130,
     latitude: 56.025517,
     longitude: 12.691433,
     name: "Helsingborg Västhamnen"
   },
   %Viva.Station{
     id: 167,
     latitude: 56.019992,
     longitude: 12.687072,
     name: "Helsingborg Öresund"
   },
   %Viva.Station{
     id: 56,
     latitude: 59.533067,
     longitude: 17.008166,
     name: "Hjulstabron"
   },
   %Viva.Station{
     id: 137,
     latitude: 56.920945,
     longitude: 18.150568,
     name: "Hoburg (SMHI)"
   },
   %Viva.Station{
     id: 134,
     latitude: 63.695429,
     longitude: 20.347527,
     name: "Holmsund"
   },
   %Viva.Station{id: 174, latitude: 63.3185, longitude: 19.1562, name: "Husum"},
   %Viva.Station{
     id: 4,
     latitude: 58.603779,
     longitude: 17.315855,
     name: "Hävringe"
   },
   %Viva.Station{
     id: 126,
     latitude: 57.8555,
     longitude: 12.0091,
     name: "Jordfallsbron"
   },
   %Viva.Station{id: 58, latitude: 58.63418, longitude: 16.324758, ...},
   %Viva.Station{id: 59, latitude: 65.788833, ...},
   %Viva.Station{id: 161, ...},
   %Viva.Station{...},
   ...
 ]}
 ```

