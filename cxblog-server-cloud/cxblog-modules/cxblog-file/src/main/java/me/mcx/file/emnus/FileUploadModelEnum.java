package me.mcx.file.emnus;

public enum FileUploadModelEnum {
    /**
     * 本地上传
     */
    LOCAL("local", "本地", "localSysFileServiceImpl"),
    /**
     * 七牛云上传
     */
    QIN("qiniu", "七牛云", "qiniuSysFileServiceImpl"),

    /**
     * 阿里云上传
     */
    MINIO("minio", "Minio", "minioSysFileServiceImpl");

    //创建构造函数
    FileUploadModelEnum(String name, String desc, String service) {
        this.name = name;
        this.desc = desc;
        this.service = service;
    }


    /**
     * 上传方式
     */
    private final String name;
    /**
     * 描述
     */
    private final String desc;
    /**
     * 策略
     */
    private final String service;

    public String getName() {
        return name;
    }

    public String getDesc() {
        return desc;
    }

    public String getService() {
        return service;
    }

    /**
     * 获取策略
     *
     * @param name 模式
     * @return {@link String} 上传策略
     */
    public static FileUploadModelEnum getService(String name) {
        for (FileUploadModelEnum value : FileUploadModelEnum.values()) {
            if (value.getName().equals(name)) {
                return value;
            }
        }
        return null;
    }
}
