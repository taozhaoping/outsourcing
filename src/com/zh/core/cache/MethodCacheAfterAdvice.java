package com.zh.core.cache;

import java.util.List;

import net.sf.ehcache.Cache;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.aop.AfterReturningAdvice;
import org.springframework.beans.factory.InitializingBean;

public class MethodCacheAfterAdvice implements AfterReturningAdvice,
		InitializingBean {
	private static final Log logger = LogFactory
			.getLog(MethodCacheAfterAdvice.class);

	private Cache cache;

	public void setCache(Cache cache) {
		this.cache = cache;
	}

	public MethodCacheAfterAdvice() {
		super();
	}

	public void afterPropertiesSet() throws Exception {

	}

	public void afterReturning(Object returnValue,
			java.lang.reflect.Method method, Object[] args, Object classObj)
			throws Throwable {
		String className = classObj.getClass().getName();
		List<?> list = cache.getKeys();
		for (int i = 0; i < list.size(); i++) {
			String cacheKey = String.valueOf(list.get(i));
			if (cacheKey.startsWith(className)) {
				cache.remove(cacheKey);
				logger.debug("remove cache " + cacheKey);
			}
		}

	}

}
