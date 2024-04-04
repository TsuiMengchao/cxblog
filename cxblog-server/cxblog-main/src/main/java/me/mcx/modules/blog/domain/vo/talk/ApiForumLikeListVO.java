package me.mcx.modules.blog.domain.vo.talk;

import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @author: 辰雪
 * @date: 2023/10/17
 * @describe:
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ApiForumLikeListVO {

    @ApiModelProperty(value = "主键id")
    private Integer id;


    @ApiModelProperty(value = "用户id")
    private String userId;

    @ApiModelProperty(value = "用户昵称")
    private String nickname;

    @ApiModelProperty(value = "用户头像")
    private String avatar;

    @ApiModelProperty(value = "用户简介")
    private String intro;

    @ApiModelProperty(value = "话题id")
    private Integer forumId;

    @ApiModelProperty(value = "当前用户是否关注")
    private Integer isFollowed;

    @ApiModelProperty(value = "创建时间")
    private Date createTime;
}
