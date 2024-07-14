/*
 *  Copyright 2019-2020 MCX
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */
package me.mcx.modules.system.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import me.mcx.base.BaseEntity;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
* @author MCX
* @date 2019-04-10
*/
@Getter
@Setter
@TableName("sys_dict_detail")
public class DictDetail extends BaseEntity implements Serializable {

    @NotNull(groups = Update.class)
    @ApiModelProperty(value = "ID", hidden = true)
    @TableId(value = "detail_id", type = IdType.AUTO)
    private Long id;

    @TableField(value = "dict_id")
    @ApiModelProperty(hidden = true)
    private Long dictId;

    @TableField(exist = false)
    private Dict dict;

    @ApiModelProperty(value = "字典标签")
    private String label;

    @ApiModelProperty(value = "字典值")
    private String value;

    @ApiModelProperty(value = "排序")
    private Integer dictSort = 999;

    @ApiModelProperty(value = "回显样式")
    private String style;

    @ApiModelProperty(value = "是否默认（1是 0否）")
    private String isDefault;

    @ApiModelProperty(value = "是否发布(1:是，0:否)")
    private String isPublish;

    @ApiModelProperty(value = "备注")
    private String remark;
}