package me.mcx.modules.blog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import me.mcx.modules.blog.domain.WebConfig;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 网站配置表 Mapper 接口
 * </p>
 *
 * @author MCX
 * @since 2021-11-27
 */
@Mapper
public interface WebConfigMapper extends BaseMapper<WebConfig> {

}
