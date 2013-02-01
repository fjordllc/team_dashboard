module Sources
  module Datapoints
    class Mixpanel < Sources::Datapoints::Base
      def supports_target_browsing?
        true
      end

      def get(targets, from, to, options = {})
        client = ::Mixpanel::Client.new(
          api_key: '222ed9530f1b66cee8811f32551f5687',
          api_secret: '6e78d6fb8c5bc79ca04e05388a8f654e'
        )
        
        data = client.request('events', { 
          event:     '["Share","Signed up","Posted story"]',
          type:      'general',
          unit:      'day',
          interval:   30,
        })

        results = []

        targets.each do |target|
          datapoints = []
          
          data["data"]["series"].each do |date|
            datapoints << [data["data"]["values"][target][date], Time.parse(date).to_i]
          end
          
          results << {'target' => target, 'datapoints' => datapoints}
        end
        
        results
      end

      def available_targets(options = {})
        pattern = options[:pattern] || ""
        limit = options[:limit] || 200

        targets = []
        targets << "Share"
        targets << "Posted story"
        targets << "Signed up"
        targets
      end
    end
  end
end
