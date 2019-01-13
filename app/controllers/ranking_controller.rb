class RankingController < ApplicationController
  layout 'review_site' 
  #layoutsのreview_siteを観に行く。review_siteのyieldでアクションのビューが読み込まれる。また@rankingも渡せる。
  #指定しない場合はapplication_recordに自動で飛んでいる。そこのyieldが動いてビューが出ている。
  #共通の処理、レイアウトをlayoutのそれぞれに書いておきビューはそれぞれ開くようにすれば手間が省ける。
  before_action :ranking #最初にrankingメソッドから始まる
  def ranking
    product_ids = Review.group(:product_id).order('count_product_id DESC').limit(5).count(:product_id).keys
    #product_idでまとめ、product_idの多さ順に並べ替え、5つに絞り、{product_id => 100}のようなハッシュを取得し、
    #keyspでroduct_idだけを抜き出すことでﾚｺｰﾄﾞの多い順にprodcut_idを取得できる
    @ranking = product_ids.map { |id| Product.find(id) }
    #ﾚｺｰﾄﾞの多いproduct_idからidに代入し、そのidでProductﾃﾞｰﾀﾍﾞｰｽからfindすることで1位～5位の配列状態で@rankingに代入
  end
end
