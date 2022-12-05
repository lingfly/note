1. article联表tags

```json
db.articles.aggregate([
    {
        "$unwind": {
            "path": "$tags"
        }
    },
		{
				"$project": {
						"tag": {
							  "$convert": {
										"input": "$tags",
										"to": "objectId"
								}
						},
						"author": 1,
						"title": 1
				}
		},
		{
				"$lookup": {
						"from": "tags",
						"localField": "tag",
						"foreignField": "_id",
						"as": "text"
				}
		}
])
```