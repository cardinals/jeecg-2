package com.jeecg.phone;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;

public class MobileUtils {
    private static Logger logger = LoggerFactory.getLogger(MobileUtils.class);

    public static DeviceType getDeviceType(HttpServletRequest request) {
        String userAgent = request.getHeader("User-Agent");
        return getDeviceTypeByUserAgent(userAgent);
    }

    public static DeviceType getDeviceTypeByUserAgent(String userAgent) {
        logger.info("getDeviceType, User Agent:" + userAgent);

        @SuppressWarnings("rawtypes")
        DeviceType deviceType = null;
        //2017-03-21 java.lang.NullPointerException
//        if (!userAgent.equals(null)) {
        if (StringUtils.isNotBlank(userAgent)) {
            if (userAgent.toUpperCase().contains("MAC") && userAgent.toUpperCase().contains("MOBILE")) {
                if (userAgent.toUpperCase().contains("IPHONE") || userAgent.toUpperCase().contains("IPAD")) {
                    logger.info("Using iPhone or iPad");
                    deviceType = DeviceType.IOS;
                }
            } else if (userAgent.toUpperCase().contains("ANDROID")) {
                logger.info("Using ANDROID");
                deviceType = DeviceType.ANDROID;
            } else {
                logger.info("Using Web or other device");
                deviceType = DeviceType.OTHER_DEVICE;
            }
        }
        return deviceType;
    }
}
