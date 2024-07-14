package me.mcx.modules.blog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import me.mcx.modules.blog.domain.SystemConfig;
import me.mcx.modules.blog.domain.vo.TableListVO;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 系统配置表 Mapper 接口
 * </p>
 *
 * @author MCX
 * @since 2021-11-25
 */
@Mapper
public interface SystemConfigMapper extends BaseMapper<SystemConfig> {

    Page<TableListVO> selectTables(Page<Object> objectPage);
}
