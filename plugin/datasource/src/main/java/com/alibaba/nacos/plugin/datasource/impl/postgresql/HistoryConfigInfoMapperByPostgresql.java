/*
 * Copyright 1999-2022 Alibaba Group Holding Ltd.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.alibaba.nacos.plugin.datasource.impl.postgresql;

import com.alibaba.nacos.common.utils.StringUtils;
import com.alibaba.nacos.plugin.datasource.constants.DataSourceConstant;
import com.alibaba.nacos.plugin.datasource.constants.TableConstant;
import com.alibaba.nacos.plugin.datasource.mapper.AbstractMapper;
import com.alibaba.nacos.plugin.datasource.mapper.HistoryConfigInfoMapper;

/**
 * The postgresql implementation of HistoryConfigInfoMapper.
 *
 * @author Long Yu
 **/
public class HistoryConfigInfoMapperByPostgresql  extends AbstractMapper implements HistoryConfigInfoMapper {

    @Override
    public String findConfigHistoryCountByTime() {
        return "SELECT count(*) FROM his_config_info WHERE gmt_modified < ?";
    }

    @Override
    public String findDeletedConfig() {
        return "SELECT DISTINCT data_id, group_id, tenant_id FROM his_config_info WHERE op_type = 'D' AND gmt_modified >= ? AND gmt_modified <= ?";
    }

    @Override
    public String findConfigHistoryFetchRows(String dataId, String groupId, String tenantId) {
        StringBuilder sb = new StringBuilder();
        sb.append("SELECT nid,data_id,group_id,tenant_id,app_name,src_ip,src_user,op_type,gmt_create,gmt_modified FROM his_config_info where 1=1 ");
        if(!StringUtils.isEmpty(dataId)){
            sb.append(" AND data_id = ? ");
        }
        if(!StringUtils.isEmpty(groupId)) {
            sb.append(" AND group_id = ? ");
        }
        if(!StringUtils.isEmpty(tenantId)) {
            sb.append(" AND tenant_id = ? ");
        }
        sb.append(" ORDER BY nid DESC ");
        return sb.toString();
    }

    @Override
    public String detailPreviousConfigHistory() {
        return "SELECT nid,data_id,group_id,tenant_id,app_name,content,md5,src_user,src_ip,op_type,gmt_create,gmt_modified "
                + "FROM his_config_info WHERE nid = (SELECT max(nid) FROM his_config_info WHERE id = ?) ";
    }

    @Override
    public String removeConfigHistory() {
        String sql = "WITH temp_table as (SELECT id FROM his_config_info WHERE gmt_modified < ? LIMIT ? ) " +
                "DELETE FROM his_config_info WHERE id in (SELECT id FROM temp_table) ";
        return sql;
    }

    @Override
    public String getTableName() {
        return TableConstant.HIS_CONFIG_INFO;
    }

    @Override
    public String getDataSource() {
        return DataSourceConstant.POSTGRESQL;
    }

}
