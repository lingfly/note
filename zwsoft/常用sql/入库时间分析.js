

db.batchInsertTask.aggregate(
    [
        {
            $match: {
                _id: "a1f28e18-7a61-4ef6-8654-9773160fdaba"
            }
        },
        {
            $unwind: "$insertInfos"
        },
        {
            $group: {
                _id: "$insertInfos.name",
                count: {
                    $sum: "$insertInfos.count"
                },
                totalTime: {
                    $sum: {
                        $divide: ["$insertInfos.totalTime", 1000]
                    }
                },
                average: {
                    $sum: {
                        $divide: ["$insertInfos.totalTime", "$insertInfos.count"]
                    }
                }
            }
        },
        {
            $project: {
                totalTime: 1,
                count: 1,
                average: {
                    $multiply: [{$divide: ["$totalTime", "$count"]},1000]
                },
                
            }
        },
        {
            $sort: {
                totalTime: - 1
            }
        }
    ]
)