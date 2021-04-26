with fix_format as (

    select * from {{ref('stg_tweets')}}

),

extract_user as (
	select
        id,
		nconst,
		body,
        substring(twitter_user, $$(?<='screen_name': ')(.*)(?=', 'loc)$$) as username,
        substring(twitter_user, $$(?<='id': )(.*)(?=, 'id)$$) as user_id,
		substring(twitter_user, $$(?<='followers_count': )(.*)(?=, 'fr)$$) as followers_count,
        substring(twitter_user, $$(?<='friends_count': )(.*)(?=, 'lis)$$) as following_count,
        retweet_count,
		favorite_count,
		created_at
    from fix_format
),

final as (

    select
        id as tweet_id,
		nconst,
		body,
        username,
		cast(user_id as bigint) as user_id,
		cast(followers_count as int) as followers_count,
        cast(following_count as int) as following_count,
        retweet_count,
		favorite_count,
		created_at
    from extract_user
)

select * from final