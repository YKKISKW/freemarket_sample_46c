class OrdersController < ApplicationController
  before_action :authenticate_user!

  # 商品購入確認画面表示
  def new
    @item = Item.find(params[:item_id])
    @user = get_user_info()
    @card_info = get_credit_card()

    # 現在のルーティングの設定上、credit_card#indexを呼ぶ際にルーティングに
    # 設定しないといけないが可変にする必要はないので0固定にしている。
    @order_id = 0

    render '/users/itemconfirm'
  end

  # 商品購入処理
  def create
    _success_flag = true
    _param = get_order_param()
    begin
      ActiveRecord::Base.transaction do
        # アイテムステータスの更新
        _item = Item.find(_param[:item_id])
        _item.update(item_status: get_item_status())
        # オーダーテーブルの生成
        _order = Order.new(_param)
        _order.save
        # 決済処理
        _settlement = Settlement.new
        _settlement.order_id = _order.id
        _settlement.charge_id = Credit.deposit_CardInfo(_param[:user_id], _item.price)
        # [@ToDo]
        # Settlementにバーリデーションを付ければcharge_idがカラだった時は、
        # saveで失敗して例外を返してくれるはず。。
        _settlement.save
      end
    rescue => e
      _success_flag = false
    end
    @MESSAGE = (_success_flag) ? "成功": "失敗"
  end

  private

  def get_order_param()
    return {
      user_id: params[:user_id].to_i,
      item_id: params[:item_id].to_i,
    }
  end

  # [@ToDo] itemテーブルのitem_statusカラムを商品購入状態に変更する仮の値を取得する。
  def get_item_status()
    return 1
  end

  # [@ToDo]Userテーブルが完璧出ないため仮のダミーデータを生成している
  def get_user_info()
    _w = current_user.slice(:id, :last_name, :first_name, :nickname)
    _ret = {}

    if (_w[:last_name] != "") && (_w[:first_name] != "")
      _ret[:name] = "#{_w[:last_name]} #{_w[:first_name]}"
    elsif _w[:nickname]
      _ret[:name] = _w[:nickname]
    else
      _ret[:name] = "真子 就有"
    end
    _ret[:id]             = _w[:id]
    _ret[:postal_code]    = "〒" + "150−0041"
    _ret[:street_address] = "東京都渋谷区神南1丁目12−16アジアビル8F"

    return _ret
  end

  def get_credit_card()
    _ret = nil
    _r = Credit.find_by(user_id: current_user.id)
    _ret = Credit.get_CardInfo(_r) if _r && _r.card_id
    return _ret
  end

end
