package me.mcx.exception;

import lombok.Getter;
import me.mcx.common.ResultCode;
import lombok.Data;

import static me.mcx.common.ResultCode.ERROR;
import static me.mcx.common.ResultCode.ERROR_DEFAULT;
import static org.springframework.http.HttpStatus.BAD_REQUEST;

/**
 * @author MCX
 * @description: 异常返回类
 * @date 2021/7/19 10:40
 */
@Data
public class BusinessException extends RuntimeException{

    private static final long serialVersionUID = 6401507641198338287L;

    /** 异常代码 */
    @Getter
    protected Integer status = BAD_REQUEST.value();

    /** 异常消息 */
    protected String msg;

    public BusinessException() {
        super();
    }

    public BusinessException(ResultCode resultCode) {
        super(resultCode.getDesc());
        this.status = resultCode.getCode();
        this.msg = resultCode.getDesc();
    }

    public BusinessException(String msg) {
        super(msg);
        this.status = ERROR_DEFAULT.getCode();
        this.msg = msg;
    }

    public BusinessException(Integer code, String msg) {
        super(msg);
        this.status = code;
        this.msg = msg;
    }

    public BusinessException(Integer code, String msg, Throwable cause) {
        super(msg, cause);
        this.status = code;
        this.msg = msg;
    }

    public BusinessException(Throwable cause) {
        super(cause);
        this.status = ERROR.getCode();
        this.msg = cause.getMessage();
    }

    @Override
    public String toString() {
        return "errorCode: " + status + ", message: " + msg;
    }
}
