class CreditCardController < ApplicationController
  before_action :authenticate_user!
  before_action :check_view_type

  # 支払い方法確認画面
  def index
    _credit_record = find_by_CreditRecord()
    if _credit_record && _credit_record.card_id
      @card_info = Credit.get_CardInfo(_credit_record)
    else
      @card_info = nil
    end
    render "index_#{@view_type}"
  end

  # 支払い方法入力画面
  def new
    @credit = Credit.new
    render "new_#{@view_type}"
  end

  # カード情報登録処理
  def create
    _token = params.require(:card_token)

    @credit_record = find_by_CreditRecord()

    # 初めてのカード登録処理の場合はレコードを作成する
    unless @credit_record
      @credit_record = Credit.new
      @credit_record.user_id = get_user_id()
    end

    Credit.regist_CardInfo(@credit_record, _token)
    @credit_record.save

    redirect_to credit_card_index_path
  end

  # カード情報削除画面
  def destroy
    _credit_record = find_by_CreditRecord()
    if _credit_record
      Credit.destroy_CardInfo(_credit_record)
      _credit_record.save
    end
    redirect_to credit_card_index_path
  end

  private

  def find_by_CreditRecord()
    return Credit.find_by(user_id: get_user_id())
  end

  def get_user_id()
    return current_user.id
  end

  # 呼び元に応じてビューの表示を変更する
  def check_view_type()
    _param = params.permit(:item_id, :order_id)
    _f = _param.empty?

    # 戻り値のステータス一覧
    # mypage : マイページの支払い方法変更から呼ばれた時
    # order  : 購入画面の支払い方法変更から呼ばれた時
    @view_type = (_f) ? ("mypage") : ("order")

    case action_name
    when "index"
      @button_url = (_f) ?
                    (new_credit_card_path):
                    (new_item_order_credit_card_path(_param))
    when "new"
    when "create"
    when "destroy"
    end

  end

end
