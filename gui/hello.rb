# gem install glimmer-dsl-swt (jRuby) or
# jgem install glimmer-dsl-swt
require 'glimmer-dsl-swt'

#class HelloComputed
  #class Contact
    #attr_accessor :first_name, :last_name, :year_of_birth

    #def initialize(attribute_map)
      #@first_name = attribute_map[:first_name]
      #@last_name = attribute_map[:last_name]
      #@year_of_birth = attribute_map[:year_of_birth]
    #end

    #def name
      #"#{last_name}, #{first_name}"
    #end

    #def age
      #Time.now.year - year_of_birth.to_i
    #rescue
      #0
    #end
  #end
#end

#class HelloComputed
  #include Glimmer

  #def initialize
    #@contact = Contact.new(
      #first_name: 'Barry',
      #last_name: 'McKibbin',
      #year_of_birth: 1985
    #)
  #end

  #def launch
    #shell {
      #text 'Hello, Computed!'
      #composite {
        #grid_layout {
          #num_columns 2
          #make_columns_equal_width true
          #horizontal_spacing 20
          #vertical_spacing 10
        #}
        #label {text 'First &Name: '}
        #text {
          #text bind(@contact, :first_name)
          #layout_data {
            #horizontal_alignment :fill
            #grab_excess_horizontal_space true
          #}
        #}
        #label {text '&Last Name: '}
        #text {
          #text bind(@contact, :last_name)
          #layout_data {
            #horizontal_alignment :fill
            #grab_excess_horizontal_space true
          #}
        #}
        #label {text '&Year of Birth: '}
        #text {
          #text bind(@contact, :year_of_birth)
          #layout_data {
            #horizontal_alignment :fill
            #grab_excess_horizontal_space true
          #}
        #}
        #label {text 'Name: '}
        #label {
          #text bind(@contact, :name, computed_by: [:first_name, :last_name])
          #layout_data {
            #horizontal_alignment :fill
            #grab_excess_horizontal_space true
          #}
        #}
        #label {text 'Age: '}
        #label {
          #text bind(@contact, :age, on_write: :to_i, computed_by: [:year_of_birth])
          #layout_data {
            #horizontal_alignment :fill
            #grab_excess_horizontal_space true
          #}
        #}
      #}
    #}.open
  #end
#end

#HelloComputed.new.launch

class HelloTable
  class BaseballGame
    class << self
      attr_accessor :selected_game

      def all_playoff_games
        @all_playoff_games ||= {
          'NLDS' => [
            new(Time.new(2037, 10, 6, 12, 0),  'Chicago Cubs', 'Milwaukee Brewers', 'Free Bobblehead'),
            new(Time.new(2037, 10, 7, 12, 0),  'Chicago Cubs', 'Milwaukee Brewers'),
            new(Time.new(2037, 10, 8, 12, 0),  'Milwaukee Brewers', 'Chicago Cubs'),
            new(Time.new(2037, 10, 9, 12, 0),  'Milwaukee Brewers', 'Chicago Cubs'),
            new(Time.new(2037, 10, 10, 12, 0), 'Milwaukee Brewers', 'Chicago Cubs', 'Free Umbrella'),
            new(Time.new(2037, 10, 6, 18, 0),  'Cincinnati Reds', 'St Louis Cardinals', 'Free Bobblehead'),
            new(Time.new(2037, 10, 7, 18, 0),  'Cincinnati Reds', 'St Louis Cardinals'),
            new(Time.new(2037, 10, 8, 18, 0),  'St Louis Cardinals', 'Cincinnati Reds'),
            new(Time.new(2037, 10, 9, 18, 0),  'St Louis Cardinals', 'Cincinnati Reds'),
            new(Time.new(2037, 10, 10, 18, 0), 'St Louis Cardinals', 'Cincinnati Reds', 'Free Umbrella'),
          ],
          'ALDS' => [
            new(Time.new(2037, 10, 6, 12, 0),  'New York Yankees', 'Boston Red Sox', 'Free Bobblehead'),
            new(Time.new(2037, 10, 7, 12, 0),  'New York Yankees', 'Boston Red Sox'),
            new(Time.new(2037, 10, 8, 12, 0),  'Boston Red Sox', 'New York Yankees'),
            new(Time.new(2037, 10, 9, 12, 0),  'Boston Red Sox', 'New York Yankees'),
            new(Time.new(2037, 10, 10, 12, 0), 'Boston Red Sox', 'New York Yankees', 'Free Umbrella'),
            new(Time.new(2037, 10, 6, 18, 0),  'Houston Astros', 'Cleveland Indians', 'Free Bobblehead'),
            new(Time.new(2037, 10, 7, 18, 0),  'Houston Astros', 'Cleveland Indians'),
            new(Time.new(2037, 10, 8, 18, 0),  'Cleveland Indians', 'Houston Astros'),
            new(Time.new(2037, 10, 9, 18, 0),  'Cleveland Indians', 'Houston Astros'),
            new(Time.new(2037, 10, 10, 18, 0), 'Cleveland Indians', 'Houston Astros', 'Free Umbrella'),
          ],
          'NLCS' => [
            new(Time.new(2037, 10, 12, 12, 0), 'Chicago Cubs', 'Cincinnati Reds', 'Free Towel'),
            new(Time.new(2037, 10, 13, 12, 0), 'Chicago Cubs', 'Cincinnati Reds'),
            new(Time.new(2037, 10, 14, 12, 0), 'Cincinnati Reds', 'Chicago Cubs'),
            new(Time.new(2037, 10, 15, 18, 0), 'Cincinnati Reds', 'Chicago Cubs'),
            new(Time.new(2037, 10, 16, 18, 0), 'Cincinnati Reds', 'Chicago Cubs'),
            new(Time.new(2037, 10, 17, 18, 0), 'Chicago Cubs', 'Cincinnati Reds'),
            new(Time.new(2037, 10, 18, 12, 0), 'Chicago Cubs', 'Cincinnati Reds', 'Free Poncho'),
          ],
          'ALCS' => [
            new(Time.new(2037, 10, 12, 12, 0), 'Houston Astros', 'Boston Red Sox', 'Free Towel'),
            new(Time.new(2037, 10, 13, 12, 0), 'Houston Astros', 'Boston Red Sox'),
            new(Time.new(2037, 10, 14, 12, 0), 'Boston Red Sox', 'Houston Astros'),
            new(Time.new(2037, 10, 15, 18, 0), 'Boston Red Sox', 'Houston Astros'),
            new(Time.new(2037, 10, 16, 18, 0), 'Boston Red Sox', 'Houston Astros'),
            new(Time.new(2037, 10, 17, 18, 0), 'Houston Astros', 'Boston Red Sox'),
            new(Time.new(2037, 10, 18, 12, 0), 'Houston Astros', 'Boston Red Sox', 'Free Poncho'),
          ],
          'World Series' => [
            new(Time.new(2037, 10, 20, 18, 0), 'Chicago Cubs', 'Boston Red Sox', 'Free Baseball Cap'),
            new(Time.new(2037, 10, 21, 18, 0), 'Chicago Cubs', 'Boston Red Sox'),
            new(Time.new(2037, 10, 22, 18, 0), 'Boston Red Sox', 'Chicago Cubs'),
            new(Time.new(2037, 10, 23, 18, 0), 'Boston Red Sox', 'Chicago Cubs'),
            new(Time.new(2037, 10, 24, 18, 0), 'Boston Red Sox', 'Chicago Cubs'),
            new(Time.new(2037, 10, 25, 18, 0), 'Chicago Cubs', 'Boston Red Sox'),
            new(Time.new(2037, 10, 26, 18, 0), 'Chicago Cubs', 'Boston Red Sox', 'Free World Series Polo'),
          ]
        }
      end

      def playoff_type
        @playoff_type ||= 'World Series'
      end

      def playoff_type=(new_playoff_type)
        @playoff_type = new_playoff_type
        self.schedule=(all_playoff_games[@playoff_type])
      end

      def playoff_type_options
        all_playoff_games.keys
      end

      def schedule
        @schedule ||= all_playoff_games[playoff_type]
      end

      def schedule=(new_schedule)
        @schedule = new_schedule
      end
    end

    include Glimmer
    include Glimmer::DataBinding::ObservableModel

    TEAM_BALLPARKS = {
      'Boston Red Sox'     => 'Fenway Park',
      'Chicago Cubs'       => 'Wrigley Field',
      'Cincinnati Reds'    => 'Great American Ball Park',
      'Cleveland Indians'  => 'Progressive Field',
      'Houston Astros'     => 'Minute Maid Park',
      'Milwaukee Brewers'  => 'Miller Park',
      'New York Yankees'   => 'Yankee Stadium',
      'St Louis Cardinals' => 'Busch Stadium',
    }

    attr_accessor :date_time, :home_team, :away_team, :ballpark, :promotion

    def initialize(date_time, home_team, away_team, promotion = 'N/A')
      self.date_time = date_time
      self.home_team = home_team
      self.away_team = away_team
      self.promotion = promotion
      observe(self, :date_time) do |new_value|
        notify_observers(:game_date)
        notify_observers(:game_time)
      end
    end

    def home_team=(home_team_value)
      if home_team_value != away_team
        @home_team = home_team_value
        self.ballpark = TEAM_BALLPARKS[@home_team]
      end
    end

    def away_team=(away_team_value)
      if away_team_value != home_team
        @away_team = away_team_value
      end
    end

    def date
      Date.new(date_time.year, date_time.month, date_time.day)
    end

    def time
      Time.new(0, 1, 1, date_time.hour, date_time.min, date_time.sec, '+00:00')
    end

    def game_date
      date_time.strftime("%m/%d/%Y")
    end

    def game_time
      date_time.strftime("%I:%M %p")
    end

    def home_team_options
      TEAM_BALLPARKS.keys
    end

    def away_team_options
      TEAM_BALLPARKS.keys
    end

    def ballpark_options
      [TEAM_BALLPARKS[@home_team], TEAM_BALLPARKS[@away_team]]
    end

    def to_s
      "#{home_team} vs #{away_team} at #{ballpark} on #{game_date} #{game_time}"
    end

    def book!
      "Thank you for booking #{to_s}"
    end
  end

  include Glimmer

  def launch
    shell {
      grid_layout

      text 'Hello, Table!'

      label {
        layout_data :center, :center, true, false

        text 'Baseball Playoff Schedule'
        font height: 30, style: :bold
      }

      combo(:read_only) {
        layout_data :center, :center, true, false
        selection bind(BaseballGame, :playoff_type)
        font height: 16
      }

      table(:editable) { |table_proxy|
        layout_data :fill, :fill, true, true

        table_column {
          text 'Game Date'
          width 150
          sort_property :date # ensure sorting by real date value (not `game_date` string specified in items below)
          editor :date_drop_down, property: :date_time
        }
        table_column {
          text 'Game Time'
          width 150
          sort_property :time # ensure sorting by real time value (not `game_time` string specified in items below)
          editor :time, property: :date_time
        }
        table_column {
          text 'Ballpark'
          width 180
          editor :none
        }
        table_column {
          text 'Home Team'
          width 150
          editor :combo, :read_only # read_only is simply an SWT style passed to combo widget
        }
        table_column {
          text 'Away Team'
          width 150
          editor :combo, :read_only # read_only is simply an SWT style passed to combo widget
        }
        table_column {
          text 'Promotion'
          width 150
          # default text editor is used here
        }

        # Data-bind table items (rows) to a model collection property, specifying column properties ordering per nested model
        items bind(BaseballGame, :schedule), column_properties(:game_date, :game_time, :ballpark, :home_team, :away_team, :promotion)

        # Data-bind table selection
        selection bind(BaseballGame, :selected_game)

        # Default initial sort property
        sort_property :date

        # Sort by these additional properties after handling sort by the column the user clicked
        additional_sort_properties :date, :time, :home_team, :away_team, :ballpark, :promotion

        #         menu {
        #           menu_item {
        #             text 'Book'
        #
        #             on_widget_selected {
        #               book_selected_game
        #             }
        #           }
        #         }
      }

      button {
        text 'Book Selected Game'
        layout_data :center, :center, true, false
        font height: 16
        enabled bind(BaseballGame, :selected_game)

        on_widget_selected {
          book_selected_game
        }
      }
    }.open
  end

  def book_selected_game
    message_box {
      text 'Baseball Game Booked!'
      message BaseballGame.selected_game.book!
    }.open
  end
end
