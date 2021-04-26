with tweet_relevant as (
    
    select 
        id,
		nconst,
		text as body,
        twitter_user,
        retweet_count,
		favorite_count,
		created_at
    from {{source('local', 'tweets')}}

) select * from tweet_relevant