package me.mcx.modules.blog.quartz;

import me.mcx.modules.blog.domain.Job;
import org.quartz.JobExecutionContext;

/**
 * @author MCX
 * @date 2021/12/8
 * @apiNote 定时任务处理（禁止并发执行）
 */
public class QuartzDisallowConcurrentExecution extends AbstractQuartzJob {
    @Override
    protected void doExecute(JobExecutionContext context, Job job) throws Exception {
        JobInvokeUtil.invokeMethod(job);
    }
}
