eKRK - Back End
========================================
## Przygotowanie środowiska deweloperskiego

### Gemy
Potrzebne nam biblioteki tzw. gemy dodajemy do pliku Gemfile.
Po każdej zmianie tego pliku pamiętajmy o wywołaniu: ```bundle install```  
Aktualizując plik Gemfile, warto również zawrzeć w tej samej rewizji plik Gemfile.lock, gdyż
>The Gemfile.lock file is where Bundler records the exact versions that were installed. This way, when the same library/project is loaded on another machine, running bundle install will look at the Gemfile.lock and install the exact same versions, rather than just using the Gemfile and installing the most recent versions.
 
### Model
Polecenie ``` rake db:migrate ``` aplikuje migracje na schema.rb w oparciu o znacznik czasu!  
Polecenie ``` rake db:setup ``` tworzy bazę danych zgodną z schema.rb (wg. ustawień database.yml) oraz wypełnia wstępnymi danymi (seed)  
Pozostałe pomocne polecenia: ``` rake db:drop ``` , ```rake db:create```  
Wraz z rozwojem aplikacji usuniemy niepotrzebne migracje oraz wpisy w naszym schemacie bazy danych
W railsach 4.2 dodano wsparcie przy tworzeniu kluczy obcych przy tworzeniu migracji.

### Debugowanie aplikacji
Niezwykle pomocne narzędzie ```rails console --sandbox```.

### Testowanie API
Poza pisaniem testów sprawdzających poprawność API polecam wtyczki do przeglądarek o nazwach RESTClient.

### Przydatne URLe:
[swagger](http://localhost:3000/api/swagger)