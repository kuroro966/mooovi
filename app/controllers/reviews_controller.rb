class ReviewsController < RankingController
  
  before_action :authenticate_user!, only: :new
  
  def new
    @product = Product.find(params[:product_id]) #@productにproduct_idを特定したインスタンスを代入
    @review = Review.new #値が空のReviewのDBレコードを生成して代入
  end

  def create
    Review.create(create_params)
    
    redirect_to controller: :products, action: :index # トップページにリダイレクトする
  end
  

  private
  def create_params
    #params.require(:review).permit(:evaluation,:review).merge(product_id: params[:product_id], nickname: current_user.nickname)
    params.require(:review).permit(:evaluation,:review).merge(product_id: params[:product_id], user_id: current_user.id)
    #form forでcreateアクションが起動。createはハッシュとキーのペアを受け取る。ハッシュがカラムでキーがレコードになる
    #paramsの中に入ってるreviewハッシュをrequireで取得。form_forでﾌｫｰﾑに書いた情報がﾊｯｼｭで格納されてる@revieを呼び出し。
    #更にproductidもcreateに渡す必要がある。mergeでくっつける。キーをparams[product_id]にして、パスのproduct_idを入れる。
    #追加：userログイン情報を使ってnikcname情報をcreateする。変更前は投稿ページでf.text_fieldでnickinameを入れて保存していた
    #createの引数は複数指定できる。paramsからpermitで持ってきたハッシュ、ここにmergeでくっ付ける
  end
end
