# ExViva

An Elixir API to weather observations from the Swedish Maritime Administration.

Listing all stations:

```elixir
iex(1)> ExViva.get_stations
{:ok,
 [
   %ExViva.Station{
     id: 169,
     latitude: 57.789774,
     longitude: 12.010189,
     name: "Agnesberg (GBG Stad)"
   },
   %ExViva.Station{id: 21, latitude: 65.5697, longitude: 22.1725, name: "Ale"},
   %ExViva.Station{
     id: 15,
     latitude: 58.484266,
     longitude: 16.960683,
     name: "Arkö"
   },
   %ExViva.Station{id: 17, latitude: 65.5727, longitude: 22.1703, name: "Atle"},
   %ExViva.Station{
     id: 25,
     latitude: 55.74588,
     longitude: 12.9168,
     name: "Barsebäck"
   },
   %ExViva.Station{
     id: 141,
     latitude: 59.32078,
     longitude: 18.15478,
     name: "Blockhusudden (SH)"
   },
   %ExViva.Station{
     id: 27,
     latitude: 59.0998,
     longitude: 17.67833,
     name: "Brandalsund"
   },
   %ExViva.Station{
     id: 30,
     latitude: 58.34005,
     longitude: 12.351683,
     name: "Brinkebergskulle Nedre"
   },
   %ExViva.Station{
     id: 31,
     latitude: 58.34102,
     longitude: 12.35092,
     name: "Brinkebergskulle Övre"
   },
   %ExViva.Station{
     id: 32,
     latitude: 58.336,
     longitude: 11.4046,
     name: "Brofjorden"
   },
   %ExViva.Station{
     id: 24,
     latitude: 58.34285,
     longitude: 11.40125,
     name: "Brofjorden Tavla 1"
   },
   %ExViva.Station{
     id: 135,
     latitude: 58.2508,
     longitude: 11.2239,
     name: "Brofjordens Angöring"
   },
   %ExViva.Station{
     id: 33,
     latitude: 60.7315,
     longitude: 17.325833,
     name: "Bönan"
   },
   %ExViva.Station{
     id: 5, 
     latitude: 58.382367,
     longitude: 12.310783,
     name: "Dalbobron"
   },
   %ExViva.Station{
     id: 34,
     latitude: 59.184833,
     longitude: 17.642833,
     name: "E4 Bron Södertälje"
   },
   %ExViva.Station{
     id: 35,
     latitude: 60.728167,
     longitude: 17.557833,
     name: "Eggegrund"
   },
   %ExViva.Station{
     id: 168,
     latitude: 57.696567,
     longitude: 11.908833, 
     name: "Eriksberg (GBG Stad)"
   },
   %ExViva.Station{
     id: 119,
     latitude: 56.88462,
     longitude: 12.468391,
     name: "Falkenberg Vind"
   },
   %ExViva.Station{
     id: 36,
     latitude: 56.892,
     longitude: 12.4895,
     name: "Falkenberg Vst"
   },
   %ExViva.Station{
     id: 91,
     latitude: 55.56098,
     longitude: 12.809541,
     name: "Flinten 16"
   },
   %ExViva.Station{
     id: 86,
     latitude: 55.589379,
     longitude: 12.844475,
     name: "Flinten 7"
   },
   %ExViva.Station{
     id: 111,
     latitude: 55.518195,
     longitude: 12.744768,
     name: "Flinten SW"
   },
   %ExViva.Station{
     id: 12,
     latitude: 60.408611,
     longitude: 18.210833,
     name: "Forsmark"
   },
   %ExViva.Station{id: 22, latitude: 65.5718, longitude: 22.171, name: "Frej"},
   %ExViva.Station{
     id: 140,
     latitude: 59.3463,
     longitude: 18.12708,
     name: "Frihamnen (SH)"
   },
   %ExViva.Station{
     id: 39,
     latitude: 59.663757,
     longitude: 18.931997, 
     name: "Furusund"
   },
   %ExViva.Station{
     id: 158,
     latitude: 64.915833,
     longitude: 21.230555,
     name: "Furuögrund (SMHI)"
   },
   %ExViva.Station{
     id: 153,
     latitude: 62.349932,
     longitude: 17.578059,
     name: "Gubben"
   },
   %ExViva.Station{
     id: 40,
     latitude: 64.6633,
     longitude: 21.3167,
     name: "Gåsören"
   },
   %ExViva.Station{id: 41, latitude: 58.0983, longitude: 12.1506, name: "Göta"},
   %ExViva.Station{
     id: 42,
     latitude: 57.71441,
     longitude: 11.9675,
     name: "Götaälvbron"
   },
   %ExViva.Station{
     id: 43,
     latitude: 56.649783,
     longitude: 12.8425,
     name: "Halmstad"
   },
   %ExViva.Station{
     id: 113,
     latitude: 57.896333,
     longitude: 11.467167,
     name: "Hamneskär"
   },
   %ExViva.Station{id: 44, latitude: 60.17, longitude: 18.482, name: "Hargs Hamn"},
   %ExViva.Station{
     id: 45,
     latitude: 56.041167,
     longitude: 12.6845,
     name: "Helsingborg"
   },
   %ExViva.Station{
     id: 129,
     latitude: 56.018933,
     longitude: 12.697067,
     name: "Helsingborg Sydhamnen"
   },
   %ExViva.Station{
     id: 130,
     latitude: 56.025517,
     longitude: 12.691433,
     name: "Helsingborg Västhamnen"
   },
   %ExViva.Station{
     id: 167,
     latitude: 56.019992,
     longitude: 12.687072,
     name: "Helsingborg Öresund"
   },
   %ExViva.Station{
     id: 56,
     latitude: 59.533067,
     longitude: 17.008166,
     name: "Hjulstabron"
   },
   %ExViva.Station{
     id: 137,
     latitude: 56.920945,
     longitude: 18.150568,
     name: "Hoburg (SMHI)"
   },
   %ExViva.Station{
     id: 134,
     latitude: 63.695429,
     longitude: 20.347527,
     name: "Holmsund"
   },
   %ExViva.Station{id: 174, latitude: 63.3185, longitude: 19.1562, name: "Husum"},
   %ExViva.Station{
     id: 4,
     latitude: 58.603779,
     longitude: 17.315855,
     name: "Hävringe"
   },
   %ExViva.Station{
     id: 126,
     latitude: 57.8555,
     longitude: 12.0091,
     name: "Jordfallsbron"
   },
   %ExViva.Station{id: 58, latitude: 58.63418, longitude: 16.324758, ...},
   %ExViva.Station{id: 59, latitude: 65.788833, ...},
   %ExViva.Station{id: 161, ...},
   %ExViva.Station{...},
   ...
 ]}
 ```

Getting observations from a particaluar station:
```elixir
iex(1)> Viva.get_station(86)
{:ok,
 %ExViva.StationSample{
   requested_at: #DateTime<2019-04-27 14:37:55.199841Z>,
   samples: [
     %ExViva.Sample{
       calm: 0,
       heading: 0,
       message: "",
       name: "Vattenstånd",
       quality: "ok",
       station_id: 86,
       trend: "",
       type: :water_level,
       unit: "cm",
       updated_at: ~N[2019-04-27 16:35:00],
       value: -18.0,
       water_level_reference: nil
     },
     %ExViva.Sample{
       calm: 0,
       heading: 0,
       message: "",
       name: "Vattentemp",
       quality: "ok",
       station_id: 86,
       trend: "",
       type: :water_temperature,
       unit: "°C",
       updated_at: ~N[2019-04-27 16:35:00],
       value: 8.2,
       water_level_reference: nil
     },
     %ExViva.Sample{
       calm: 0,
       heading: 0,
       message: "",
       name: "Vattentemp Botten",
       quality: "ok",
       station_id: 86,
       trend: "",
       type: :water_temperature, 
       unit: "°C",
       updated_at: ~N[2019-04-27 16:35:00],
       value: 6.7,
       water_level_reference: nil
     },
     %ExViva.Sample{
       calm: 0,
       heading: 204,
       message: "",
       name: "Ström Yta",
       quality: "ok",
       station_id: 86,
       trend: "",
       type: :stream,
       unit: "knop",
       updated_at: ~N[2019-04-27 16:35:00],
       value: 1.1,
       water_level_reference: nil
     },
     %ExViva.Sample{
       calm: 0,
       heading: 218,
       message: "",
       name: "Ström 4m",
       quality: "ok",
       station_id: 86,
       trend: "",
       type: :stream,
       unit: "knop",
       updated_at: ~N[2019-04-27 16:35:00],
       value: 0.9,
       water_level_reference: nil
     },
     %ExViva.Sample{
       calm: 0,
       heading: 208,
       message: "",
       name: "Ström 2m",
       quality: "ok",
       station_id: 86,
       trend: "",
       type: :stream,
       unit: "knop",
       updated_at: ~N[2019-04-27 16:35:00],
       value: 1.7,
       water_level_reference: nil
     },
     %ExViva.Sample{
       calm: 0,
       heading: 0,
       message: "",
       name: "Salthalt",
       quality: "ok",
       station_id: 86,
       trend: "",
       type: :salinity,
       unit: "‰",
       updated_at: ~N[2019-04-27 16:35:00],
       value: 8.4,
       water_level_reference: nil
     },
     %ExViva.Sample{
       calm: 0,
       heading: 0,
       message: "",
       name: "Salthalt Botten",
       quality: "ok",
       station_id: 86,
       trend: "",
       type: :salinity,
       unit: "‰",
       updated_at: ~N[2019-04-27 16:35:00],
       value: 24.8,
       water_level_reference: nil
     },
     %ExViva.Sample{
       calm: 0,
       heading: 0,
       message: "",
       name: "Densitet Botten",
       quality: "ok",
       station_id: 86,
       trend: "",
       type: :water_density,
       unit: "kg/m³",
       updated_at: ~N[2019-04-27 16:35:00],
       value: 1019.4,
       water_level_reference: nil
     }
   ],
   station_id: 86
 }}
```
