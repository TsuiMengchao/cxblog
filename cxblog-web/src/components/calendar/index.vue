<template>
    <div class="calendar-box">
        <!-- 当前年月 -->
        <div class="calendarCureent">
            <i class="el-icon-arrow-left" @click="lastMonth"></i>
            <span class="time">{{ time.year }}年{{ time.month + 1 }}月</span>
            <i @click="nextMonth" :class="{ disabled: disabled }" class="el-icon-arrow-right"></i>
        </div>
        <!-- 日历表头 -->
        <div class="calendarTop">
            <div class="calendar-tag" v-for="ite in top" :key="ite">
                <span>{{ ite }}</span>
            </div>
        </div>
        <!-- 具体内容 -->
        <div class="calendarBottom">
            <div class="calendar-content">
                <div class="calendar-item" :class="ite.thisMonth" v-for="(ite, indx) in dateList" :key="indx">
                    <!-- 号数 -->
                    <div class="calendar-item-number" @click="handleClike(ite)"
                        :id="signRecords.indexOf(ite.timeStr) != -1 && ite.isToday != 'isToday' ? 'sign' : ''"
                        :class="ite.isToday">
                        {{ ite.day }}
                        <span class="item" v-if="ite.isToday == 'isToday'">今</span>
                        <i class="el-icon-check icon" v-if="signRecords.indexOf(ite.timeStr) != -1"></i>
                    </div>
                </div>
            </div>
        </div>
        <div class="desc">

            <span class="btnIem" v-if="signRecords.indexOf(today) != -1">
                <i class="el-icon-time"></i> 今日已签到
            </span>
            <span class="btnIem btn" v-else>
                <el-button type="primary" icon="el-icon-finished" round size="small"
                    @click="handleClike(null)">立即签到</el-button>
            </span>
        </div>

    </div>
</template>
   
<script>
import { getSignRecords, sign } from '@/api/sign'
import { getToken } from '@/utils/cookieUtil'
export default {
    name: '',
    data() {
        return {
            disabled: false,
            time: {
                year: new Date().getFullYear(),
                month: new Date().getMonth()
            },
            today: new Date().getFullYear() + '-' + (new Date().getMonth() + 1 < 10 ? ('0' + (new Date().getMonth() + 1)) : new Date().getMonth() + 1) + '-'
                + (new Date().getDate() < 10 ? ('0' + new Date().getDate()) : new Date().getDate()),
            signRecords: [],
            userInfo: this.$store.state.userInfo,
            dateList: [],
            top: ['一', '二', '三', '四', '五', '六', '日']
        }
    },
    computed: {
        visibleCalendar() {
            // 获取今天的日期并将时间设置到 0分0秒0点
            const today = new Date()
            this.getDateList(today)
        }
    },
    created() {
        this.getDateList(new Date())
        this.getSignRecords()
    },
    methods: {
        getSignRecords() {
            if (this.userInfo) {
                let params = {
                    startTime: this.dateList[0].timeStr,
                    endTime: this.dateList[this.dateList.length - 1].timeStr,
                }
                if (getToken()) {
                    getSignRecords(params).then(res => {
                        this.signRecords = res.data
                    })
                }
            }
        },
        handleClike(ite) {
            if (ite != null && ite.afterToday == "afterToday") {
                this.$toast.error('未到签到时间，请耐心等待！')
                return;
            }
            const time = ite ? ite.timeStr : this.today
            sign(time).then(res => {
                this.signRecords.push(time)

                this.$toast.success('签到成功')
            })
        },
        lastMonth() {
            //一旦点击上个月 则禁用按钮不在需要禁用 
            this.disabled = false
            // 获取上个月的日期
            const lastMonth = new Date(this.time.year, this.time.month - 1);
            this.time.year = lastMonth.getFullYear()
            this.time.month = lastMonth.getMonth()
            this.getDateList(lastMonth)
            this.getSignRecords()
        },
        nextMonth() {
            if (this.time.year == new Date().getFullYear() && this.time.month == new Date().getMonth()) {
                this.disabled = true
                return;
            }
            // 获取上个月的日期
            const nextMonth = new Date(this.time.year, this.time.month + 1);
            this.time.year = nextMonth.getFullYear()
            this.time.month = nextMonth.getMonth()
            this.getDateList(nextMonth)
            this.getSignRecords()
        },
        getDateList() {
            const today = new Date();
            today.setHours(0)
            today.setMinutes(0)
            today.setSeconds(0)
            today.setMilliseconds(0)
            const calendarArr = []
            // 获取当前月份第一天
            const currentFirstDay = new Date(this.time.year, this.time.month, 1)
            // 获取第一天是周几，注意周日的时候getDay()返回的是0，要做特殊处理
            const weekDay =
                currentFirstDay.getDay() === 0 ? 7 : currentFirstDay.getDay()

            // 用当前月份第一天减去周几前面几天，就是看见的日历的第一天
            const startDay = currentFirstDay - (weekDay - 1) * 24 * 3600 * 1000
            // 我们统一用42天来显示当前显示日历
            for (let i = 0; i < 42; i++) {
                const date = new Date(startDay + i * 24 * 3600 * 1000)
                calendarArr.push({
                    date: new Date(startDay + i * 24 * 3600 * 1000),
                    year: date.getFullYear(),
                    month: date.getMonth(),
                    day: date.getDate(),
                    // 是否在当月
                    thisMonth:
                        date.getFullYear() === this.time.year &&
                            date.getMonth() === this.time.month
                            ? 'thisMonth'
                            : '',
                    // 是否是今天
                    isToday:
                        date.getFullYear() === today.getFullYear() &&
                            date.getMonth() === today.getMonth() &&
                            date.getDate() === today.getDate()
                            ? 'isToday'
                            : 'notToday',
                    // 是否在今天之后
                    afterToday: date.getFullYear() >= today.getFullYear() && date.getMonth() >= today.getMonth() && date.getDate() > today.getDate() ? 'afterToday' : '',
                    // 得到日期字符串，格式 yyyy-MM-dd 00:00:00
                    timeStr: date.getFullYear() + '-' + (date.getMonth() + 1 < 10 ? ('0' + (date.getMonth() + 1)) : date.getMonth() + 1) + '-'
                        + (date.getDate() < 10 ? ('0' + date.getDate()) : date.getDate()),
                    // 得到date类型日期
                    timeDate: date
                })
            }
            this.dateList = calendarArr
        }
    },
}
</script>
   
<style lang='scss' scoped>
// vue style中的样式
.calendar-box {
    width: 100%; // 这里日历总的大小 取决于你自己的页面布局
    height: 100%;
    display: flex; // flex流式布局
    flex-direction: column; // flex流式布局 竖向排列
    background-color: var(--theme-color);
    border-radius: 5px;
    text-align: center;

    .calendarCureent {
        font-size: 1.2rem;
        padding: 10px 0;
        color: #fff;
        border-bottom: 1px solid var(--border-line);

        .time {
            margin: 0 5px;
        }

        i {
            cursor: pointer;
        }

        .disabled {
            pointer-events: none;
            opacity: 0.5;
        }
    }

    .calendarTop {
        width: 100%;
        height: 30px; // 根据自己的页面固定好高度
        display: flex; // flex流式布局 默认是横向排列
        justify-content: space-evenly; // flex流式布局 相等间距
        padding-top: 10px;

        .calendar-tag {
            width: 14%;
            height: 30px; // 高度根据自己页面调整 

            span {
                width: 100%;
                height: 30px; // 高度根据自己页面调整 
                font-weight: bold; // 字体加粗
            }
        }
    }

    .calendarBottom {
        width: 100%;
        height: calc(100% - 30px); // 高度是父级div 的高度减去.calendarTop 的高度
        max-height: 420px;

        .calendar-content {
            width: 100%;
            height: 100%;
            display: flex;
            flex-wrap: wrap; // 超出宽度换行
            justify-content: space-evenly;

            .calendar-item {
                width: 14%; // 这个宽度需要和 .calendar-tag 的宽度保持一致(和星期几对应)
                height: 16%; // 高度根据实际需求调整
                display: flex; // flex流式布局
                margin: auto;
                color: #c0c4cc;
                align-items: center;
                position: relative;

                .calendar-item-number {
                    width: 100%;
                    height: 20px;
                    cursor: pointer;

                    .icon {
                        position: absolute;
                        bottom: 5px;
                        right: 5px;
                        color: rgb(0, 255, 149);
                        font-size: 18px;
                    }
                }

                .calendar-item-content {
                    width: 100%;
                    height: calc(100% - 20px);
                }

                .isToday,
                #sign {
                    border: 1px solid #fff;
                    border-radius: 50%;
                    width: 30px;
                    height: 30px;
                    margin-left: 10px;
                    color: #000;
                    background-color: #fff;
                    line-height: 30px;

                    .item {
                        font-size: 0.8rem;
                        position: absolute;
                        top: -5px;
                        right: 0;
                        color: #fff;
                    }
                }

                #sign {
                    background-color: rgba(0, 0, 0, .1);
                    border: none;
                }

            }

            .thisMonth {
                color: #fff;
            }


        }



    }

    .desc {
        border-top: 1px solid #c0c4cc;
        padding: 10px 0;
        color: #fff;
        height: 30px;

        .btnIem {
            float: right;
            margin-right: 20px;
            font-size: 0.8rem;
            line-height: 30px;
        }

        .btn {
            cursor: pointer;

            /deep/ .el-button--primary {
                background-color: #66b1ff;
                font-size: 0.8rem;
            }

            /deep/ .el-button--small {
                padding: 8px 15px;
            }
        }
    }
}
</style>