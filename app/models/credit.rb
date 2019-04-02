class Credit < ApplicationRecord
  belongs_to :user


  def self.regist_CardInfo(record, token)
    set_api_key()

    # 顧客未作成時は作成する
    unless record.customer_id
       _work = Payjp::Customer.create(description: 'test')
       record.customer_id = _work[:id]
    end

    # 顧客オブジェを取得する
    _customer_obj = Payjp::Customer.retrieve(record.customer_id)

    # 顧客情報とカード情報をリンクさせる
    record.card_id = _customer_obj.cards.create(card: token)[:id]
  end

  def self.get_CardInfo(record)
    set_api_key()

    #顧客情報の取得
    _customer = Payjp::Customer.retrieve(record.customer_id)

    #顧客のカード情報取得
    _card_info = _customer.cards.retrieve(_customer[:default_card])

    #戻り値の生成
    return {
      brand:     _card_info.brand.downcase,
      exp_month: _card_info.exp_month,
      exp_year:  _card_info.exp_year%100, # 2019(年)から19を取り出すため
      last4:     _card_info.last4,
    }
  end

  def self.destroy_CardInfo(record)
    set_api_key()

    # 顧客情報を取得する
    _customer_obj = Payjp::Customer.retrieve(record.customer_id)

    # 顧客に紐づいたカード情報を削除する
    _card = _customer_obj.cards.retrieve(record.card_id)

    # カード情報の削除に成功したらcard_idカラムを更新する。
    record.card_id = nil if _card.delete[:deleted]
  end

  private
  def self.set_api_key
    #APIキーの設定
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
  end

end
