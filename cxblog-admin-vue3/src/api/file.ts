import request from "@/utils/request";

/**
 * 上传文件
 *
 * @param queryParams
 */
export function upload(data: any) {
  return request({
    url: "/file/upload",
    method: "POST",
    headers: { "Content-Type": "multipart/articles-data" },
    data,
  });
}

/**
 * 删除文件
 * @param key
 * @returns
 */
export function delBatchFile(key: string) {
  return request({
    url: "/file/delete",
    method: "delete",
    params: {
      key: key,
    },
  });
}
