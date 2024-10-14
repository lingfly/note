-- 查询保存的json
SELECT
	file.store_path,
	size/1024/1024,
	FROM_UNIXTIME( upload_time ) 
FROM
	attr_string_val_1 attr
	JOIN obj_stream_1 st ON attr.oid = st.oid
	JOIN wk_file_1 file ON st.str_uuid = file.uuid 
WHERE
	attr.a_oid = ( SELECT oid FROM wk_ao.object_attr_lib WHERE NAME = 'TaskRootId' ) 
	AND attr.val = '4aca5d3d-f0c5-40c5-9e9f-02560fe98546' 
ORDER BY
	file.upload_time ASC;

-- ---------------------
-- 查询所有任务状态
SELECT
	attr1.*, FROM_UNIXTIME(obj.created_at) AS create_time,FROM_UNIXTIME(obj.updated_at) AS update_time
FROM
	attr_string_val_1 attr1 
	JOIN obj_1 obj ON attr1.oid = obj.oid 
WHERE
	attr1.oid IN (
	SELECT
		attr2.oid 
	FROM
		attr_string_val_1 attr2 
	WHERE
		attr2.a_oid = ( SELECT oid FROM wk_ao.object_attr_lib WHERE NAME = 'TaskRootId' ) 
	AND attr2.val = 'cd3c942b-943c-4cbf-b3c2-2d22cfe718df' 
	)
	ORDER BY obj.created_at ASC
	;