with actors as (

    select * from {{ref('stg_actors')}}

),

tweets as (

    select * from {{ref('stg_tweets_user')}}

),

final as (

    select
        tweets.tweet_id,
		tweets.nconst,
        actors.actor,
		tweets.body,
        tweets.username,
		tweets.user_id,
		tweets.followers_count,
        tweets.following_count,
        tweets.retweet_count,
		tweets.favorite_count,
		tweets.created_at
    from tweets left join actors
    on tweets.nconst = actors.nconst

) select * from final