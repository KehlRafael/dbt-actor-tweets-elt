with top_actors as (

    select 
        nconst,
        "primaryName" as actor
    from {{source('local', 'actors')}}
    group by nconst, "primaryName"
    
) select * from top_actors