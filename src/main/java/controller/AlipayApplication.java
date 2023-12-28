package controller;

import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.api.response.AlipayTradePagePayResponse;

public class AlipayApplication {
        // 账户：ginems2888@sandbox.com
        // 密码：111111

        // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
        public static String app_id = "9021000132645846";
        // 商户私钥，您的PKCS8格式RSA2私钥
        public static String merchant_private_key="MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDEpFi3io7bKhDgzLGcQcs+MQ5XDmgLfpxrYxfeyV7jsrHG2kKvesHPaIN7+PXlkTP6rm/yZHtasdljuUOObAMapB/x+dxFyrDxcdD/ZwFV/IOa3IVzf4GmxRcYo5vFftH7W7WQzt/8nw0RbvBV3raMXyXPKEsVvx4kadIfQUODM8uOEC+l8NlMSVPwHs5v5w+QVvGtOjU64pTWLM1CVKBjhtNZVO6mStbTcOkGV9uxmHuqiTQmZxtP+BjqGPfY1m0hbHZUtoLdvEtOjHhdKLT63ZKqA9TGV9sP7GXePGbK1Od2vAToKhIJRY8wqZfz+/bjfEbY0S2bPlmH3SBuH7szAgMBAAECggEBAKoPkAI7vExiVvJzVG9Un1cLyeEUPnsiZlig/HXaJUw6sHDPNbjZK2AafQvsRYziRNfZoEs7B0tqYB1Ujc5QL2cM5eu5MPzSzLAixKL9DDS3C4IUkP1QGmqGLPFMHV1xzlvZ9m5j22Z4jy6yiPtafvlrGCHOMRF/lavcMLKDGMYPsy/pDfn4ql2P5nfIdhbo17O62Z9aRJCWCW8FpR/i7iU3jegfy7g47V9N9DfACzIk+6n+VwbErp8ABBYgHZLyVrG362p/WQCriEaVTKDM9IQpcum5mkH2tyUfTYgWyGkv6G9LTo9fk8ckagFacZO5reLo1mzC6cXm5lKHigZPQXECgYEA40psWqXqFRCNo/f7HEZsxX2IQ77QRE3djDqqFvXVTD1VqpvZbnfZZDiAh567OBUS7YPcz2LJsPD9k2lv27Nvk7mlmV3P1BP1RedWW0coAVSUKfhqlE+hk9cKgwZFBT+5Rw1O4tCzRH7thuycgJoLFp04ahWUXyNwJTlYYWw4+c0CgYEA3Xrg71+Nez3hxb3OVs8oG+RF+oQr5kWCTQgGZtC2FJ2yiBuvWoeeaw+sOZhyGuzD7rACbtcqKPYBsG3XyY6iHExP7qHPrT5Ol2bhCi/8JJcXs6zobi8k85T1bC62p2GkjIPARN4VLow7I1TJxPu0+g2qwbx7xHt4VLsAl71SiP8CgYB0EyTk4kh6O3rqWxE9rmWMMgCuADuiNlXHcIo+sYsdpVEjkPXoqYI24XgaSqD4EiMZczcIHj48g8YsSzNZ8vgvbCa6/SLO/uZKrcr3UI6Ip2YHTRs45LXyp2Zx5XjIJnP7ajt4L/btKxkox5thPcod4WrXGnAsag+youeU0U0DnQKBgANc0TtxJPHBD8NzzUUuIfrCbXmPNidp2L+Yppg7BPitKD++w9vJAVO4yjGZqenUvGjMTU0ngSFcEsx97m/F9ZoeYnxKAqAruP+9dR81eUuI67gzoNfDaXk1QsCguO8zoU7s1Sd2g7XQNTmlGOcftzCwsm38kZh7E2md6TVkj3M7AoGBAN0BIz6KMnYBE7fPU0rRGuAjQOy1mFyXs1P2a/UIuEgnG5LKYSmDJaf54923LsBBrP1JhDiZ2V7KyvjBJzu1fUJQEIHs/QWZ7pG//D29lZLcY2QBil8Eq9z6h3EDo60XGsdgHuRiX3P/q85jPdKeHX09DfIK2HQmLsH9XcElo+9I";
        // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
        public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwD8KKKSOsCPsaxVFKjNsPuqC0HBmYvih8DhJQY/599hGE7v5Cdxntxnk1c+fhpr3Q4VQs+JctqU3/VoP6F2rail2XXVr2HP9fk1Ijm77G1mVJKo5UzEBftx418qh7kCoNznHOkvzeVY5sQHWuvx3/g1JntGoCaxT5Dabjv+W5gP6xq9W/lqMKB1pqJaQ+0IufX0jQLbfCFLCjBiBwzb1Cso1SACt/1JRIptGFjOTZwvTM/rTWvJjLLN9ucXmkD/YvoRcqU/ZofXjPCf9G+bNQVPt3SV6TVN0OnE5wdywBh1tudj6GpDto2z1QVY2kmfywmBi8QxzOdzSb2TG6j4DnwIDAQAB";
        // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
        public static String notify_url = "http://2h4asj.natappfree.cc/maoyan_war_exploded/asynchronous";
        // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
        public static String return_url = "http://localhost:8080/maoyan_war_exploded/pay?method=returnSelectSeatsPage";
        // 签名方式
        public static String sign_type = "RSA2";
        // 字符编码格式
        public static String charset = "utf-8";
        // 支付宝网关
        public static String gatewayUrl = "https://openapi-sandbox.dl.alipaydev.com/gateway.do";
		// out_trade_no:订单号16位数字的随机数
		// price：价格
		// subject：随机一个字符串，不能用中文
        public static String pay(int out_trade_no,double price,String subject) throws AlipayApiException {
        AlipayClient alipayClient = new DefaultAlipayClient(gatewayUrl,app_id,merchant_private_key,"json",charset,alipay_public_key,sign_type);
        AlipayTradePagePayRequest request = new AlipayTradePagePayRequest();
        request.setNotifyUrl(notify_url);
        request.setReturnUrl(return_url);
        JSONObject bizContent = new JSONObject();
        bizContent.put("out_trade_no", System.currentTimeMillis()+out_trade_no);
        bizContent.put("total_amount", price);
        bizContent.put("subject", subject);
        bizContent.put("product_code", "FAST_INSTANT_TRADE_PAY");
        request.setBizContent(bizContent.toString());
//        System.out.println("bizContent: "+ bizContent.toString());
        AlipayTradePagePayResponse response = alipayClient.pageExecute(request);
        String form ="";
        if(response.isSuccess()){
//            System.out.println("调用成功");
            form = response.getBody();
        } else {
//            System.out.println("调用失败");
        }
        return form;
    }
}
