namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando DB") { %x(rails db:drop) }
      show_spinner("Criando DB") { %x(rails db:create) }
      show_spinner("Migrando DB") { %x(rails db:migrate) }
      %x(rails dev:add_miner)
      %x(rails dev:add_coins) 
     
    else 
      puts "Não é possível executar este comando nesse ambinete"
    end
  end

  desc "Cadastra moedas"
  task add_coins: :environment do
    show_spinner("Cadastrando moedas") do
      coins = [
        {
            description: 'Bitcoin',
            acronym: 'BTC',
            url_image: 'https://cryptologos.cc/logos/bitcoin-btc-logo.png?v=029',
            mining_type_id: 1
        },
        {
            description: 'Ethereum',
            acronym: 'ETH',
            url_image: 'https://cdn.decrypt.co/wp-content/uploads/2019/03/ethereum.png',
            mining_type_id: 2
        },
        {
            description: 'Dash',
            acronym: 'DASH',
            url_image: 'https://s2.coinmarketcap.com/static/img/coins/64x64/131.png',
            mining_type_id: 1
        },
        {
            description: 'Litecoin',
            acronym: 'LTC',
            url_image: 'https://thecollegeinvestor.com/wp-content/uploads/2017/06/Litecoin.png',
            mining_type_id: 3
        },
        {
            description: 'Solana',
            acronym: 'SOL',
            url_image: 'https://cryptologos.cc/logos/solana-sol-logo.png?v=029',
            mining_type_id: 2
        }
      ]

      coins.each do |coin|
          Coin.find_or_create_by!(coin)
      end
    end
  end

  desc "Cadastro de tipos de mineração"
  task add_miner: :environment do
    show_spinner("Cadastrando tipos de mineração") do
      mining_types = [        
        {
          description: "Proof of Work",
          acronym: "PoW",
        },
        {
          description: "Proof of Stake",
          acronym: "PoS",
        },
        {
          description: "Proof of Capacity",
          acronym: "PoC",
        }
      ]

      mining_types.each do |miner|
          MiningType.find_or_create_by!(miner)
      end
    end
  end

private 

  def show_spinner(mens_inicio, mens_final = "Concluido com sucesso!!")
    spinner = TTY::Spinner.new("[:spinner] #{mens_inicio}....")
    spinner.auto_spin
    yield
    spinner.success("(#{mens_final})")
  end
end


